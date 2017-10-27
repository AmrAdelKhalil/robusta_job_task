class MoviesController < InheritedResources::Base

  def index
    @movies = Movie.all
  end

  def recently_opened_movies_within_a_week
    beginning_of_the_week = Date.today.beginning_of_week(start_day = :sunday).strftime('%Y-%m-%d')
    the_end_of_the_week = Date.today.end_of_week(start_day = :sunday).strftime('%Y-%m-%d')
    
    @movies = Movie.where("releasing_date >= ?", beginning_of_the_week).where("releasing_date <= ?", the_end_of_the_week).order("releasing_date ASC")
  end

  private

    def movie_params
      params.require(:movie).permit()
    end
end
