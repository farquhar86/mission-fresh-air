class SuperusersController < ApplicationController
  
  before_action :require_login, only: [:show]

  def show
  	
  	@superuser = Superuser.find(1)
  	@purchases = Purchase.all.order(created_at: :desc)
  	@shippedOut = Purchase.all.order(shipped: :desc)

  end

  
	

end
