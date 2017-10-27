class DirectorsController < ApplicationController

  private

    def director_params
      params.require(:director).permit()
    end
end
