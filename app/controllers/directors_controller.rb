class DirectorsController < InheritedResources::Base

  private

    def director_params
      params.require(:director).permit()
    end
end

