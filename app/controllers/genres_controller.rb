class GenresController < ApplicationController

  def categorize_movies_by_genre
    genre = params[:genre]
    genre_record = Genre.find_by name: genre

    unless genre_record.nil?
      render json: { "movies": genre_record.movies.to_json }, status: :ok
    end
    render json: {}, status: :unprocessable_entity
  end

  private

    def genre_params
      params.require(:genre).permit()
    end
end
