class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reviews = Review.movie_reviews(params[:movie_id])
  end

  def show

  end

  def new
    unless Movie.exists?(params[:movie_id])
      render :file => 'public/404.html', :status => :not_found
    end
    @review = Review.new(movie_id: params[:movie_id])
  end

  def create

    @review = Movie.find(params[:movie_id]).reviews.build(:user_id=>current_user.id, :description=> params[:review][:description], :rate=> params[:review][:rate])

    if @review.save
      redirect_to movie_path(:id=>@review.movie_id)
    else
      render 'new'
    end
  end

  private

    def review_params
      params.require(:review).permit()
    end
end
