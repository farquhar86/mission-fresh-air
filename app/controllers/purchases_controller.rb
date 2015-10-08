class PurchasesController < ApplicationController
  
  before_action :require_login, only: [:index]

  def index
    
    @superuser = Superuser.find(1)
    @purchases = Purchase.all.order(created_at: :desc)
    @shippedOut = Purchase.all.order(shipped: :desc)

  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new new_purchase_params
    charge_card
    @purchase.save

    redirect_to @purchase

  rescue Stripe::CardError => e
    flash[:error] = e.message
    render :new
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def edit
    purchase = Purchase.find(params[:purchase_id])
    purchase.update_attribute(:shipped, DateTime.now)
    redirect_to "/superusers/:id"
  end
 
 private

    def to_param
     uuid
    end

  	def purchase_params  
      params.require(:purchase).permit(:first_name, :last_name, :address, :city, :state, :country, :zip, :telephone, :email, :card_token)
    end

    def stripe_params
      params.permit :stripeEmail, :stripeToken
    end

    def new_purchase_params
      {amount: 22}.merge(purchase_params)
    end

    def charge_card
      Stripe::Charge.create(
        amount: 2200,
        description: 'Mission Fresh Air',
        currency: 'usd',
        source: params[:purchase][:card_token]
      )
    end

end
