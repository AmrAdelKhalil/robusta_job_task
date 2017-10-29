class MoviesController < ApplicationController
  before_action :authenticate_user!
  def index
    @movies = movie_generator(Movie.all, params[:genre])
    @genres_names = Genre.names_of_all_generes
  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = Review.movie_reviews(@movie.id)
    @movie_rate = Review.calculate_rating(@reviews)
  end

  def recently_opened_movies_within_a_week
    beginning_of_the_week = Date.today.beginning_of_week(start_day = :sunday).strftime('%Y-%m-%d')
    the_end_of_the_week = Date.today.end_of_week(start_day = :sunday).strftime('%Y-%m-%d')

    @movies = Movie.where("releasing_date >= ?", beginning_of_the_week).where("releasing_date <= ?", the_end_of_the_week).order("releasing_date ASC")

    @movies = movie_generator(@movies, params[:genre])
    @genres_names = Genre.names_of_all_generes
  end

  def add_to_watchlist
    movie = Movie.find_by id: params[:movie_id]

    if !movie.nil?
      current_user.movies << movie
      notice_messge = "<strong>" + movie.name.capitalize + "</strong> has been added successfully to your watchlist"
      flash[:notice] = notice_messge
    else
      alert_message = " The movie has not been added to your watchlist, Something goes wrong, Try again later or it might seems that there is no such movie"
      flash[:alert] = alert_message
    end
    redirect_to root_url
  end

  def share_movie
    movie = Movie.find(params[:movie_id])
    reviews = Review.movie_reviews(movie.id)
    rate = Review.calculate_rating(reviews)
    description_message = movie.name.capitalize + "\nthis movie got a rate " + rate.to_s + " of 5.0"

    begin
      current_user.facebook.put_wall_post(description_message)
      render json: {}, status: :ok
    rescue => e
      puts '$$$$$$$$$$$$$$$$$$$$$$$$'
      render json: e, status: :bad_request
    end
  end

  def my_watchlist
    @movies = movie_generator(current_user.movies, params[:genre])
    @genres_names = Genre.names_of_all_generes
  end

  private

    def movie_params
      params.require(:movie).permit()
    end

    def movie_generator(movies, genre = nil)
      @genre = "All"
      if genre.nil?
        movies
      else
        @genre = genre
        movies.all.select{ |movie| movie unless movie.got_the_genre?(genre) }
      end
    end
end
