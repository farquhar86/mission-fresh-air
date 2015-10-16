class PurchasesController < ApplicationController

  before_action :require_login, except: [:new, :create]
  before_action :find_purchase, only: [:show, :update]

  def index
    unshipped_purchases
    shipped_purchases
  end

  def new
    @purchase = Purchase.new
  end

  def create
    make_new_purchase_from_params
    charge_card
    @purchase.save
    redirect_to @purchase

  rescue Stripe::CardError => e
    flash[:error] = e.message
    render :new
  end

  def show
  end

  def update
    find_purchase.add_ship_date
    redirect_to "/purchases"
  end

 private

    def find_purchase
      @purchase = Purchase.find(params[:id])
    end

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

    def make_new_purchase_from_params
      @purchase = Purchase.new new_purchase_params
    end

    def unshipped_purchases
      @purchases = Purchase.all.order(created_at: :desc)
    end

    def shipped_purchases
      @shippedOut = Purchase.all.order(shipped: :desc)
    end

end
