class SessionsController < ApplicationController
  def new
  	@superuser = Superuser.new
  	render :new
  end

  def create
  	@superuser = Superuser.confirm(superuser_params)

  	if @superuser
  		login(@superuser)
  		redirect_to "/superusers/:id" 
  	else
  		redirect_to superusers_path
  	end
  end

  def destroy
    logout
    redirect_to root_path
  end

  private
  def superuser_params
  	params.require(:superuser).permit(:email, :password)
  end
end
