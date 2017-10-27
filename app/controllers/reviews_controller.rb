class ReviewsController < InheritedResources::Base

  def edit
    @review = Review.find(params[:id])
  end
  def update

  end
  private

    def review_params
      params.require(:review).permit()
    end
end
