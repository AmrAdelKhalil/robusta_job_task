class ReviewsController < ApplicationController

  def index
    @reviews = Review.movie_reviews(params[:movie_id])
  end

  def show

  end

  def new
    @review = Review.new
  end

  def create

    @review = Movie.find(params[:movie_id]).reviews.build(:user_id=>current_user.id)

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
