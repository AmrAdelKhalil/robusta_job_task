class ActorsController < ApplicationController

  private

    def actor_params
      params.require(:actor).permit()
    end
end
