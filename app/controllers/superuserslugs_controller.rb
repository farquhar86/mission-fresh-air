class SuperuserslugsController < InheritedResources::Base

  private

    def superuserslug_params
      params.require(:superuserslug).permit(:name, :slug)
    end
end

