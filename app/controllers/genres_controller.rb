class GenresController < InheritedResources::Base

  private

    def genre_params
      params.require(:genre).permit()
    end
end

