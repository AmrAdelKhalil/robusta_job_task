class ActorsController < InheritedResources::Base

  private

    def actor_params
      params.require(:actor).permit()
    end
end
