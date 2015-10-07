class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
  end
  # def process_payment

  #   charge = Stripe::Charge.create(
  #     amount: @total_amount.to_int,
  #     description: 'Shyft Booking',
  #     currency: 'usd',
	 #  source: card_token
  #   )

  # end
  def create
    new_params = {amount: 22}.merge(purchase_params)
    # new_params = purchase_params
    # new_params[:amount] = 1500
    @purchase = Purchase.create new_params
    

 

    raise "Please, check booking errors" unless @purchase.valid?

    Stripe::Charge.create(
      amount: 2200,
      description: 'Mission Fresh Air',
      currency: 'usd',
    source: params[:purchase][:card_token]
    )

    @purchase.save
   
    redirect_to @purchase

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end

  def show
    @purchase = Purchase.find(params[:id])
  end
  def to_param
   uuid
  end
 private
  	def purchase_params
      
      params.require(:purchase).permit(:first_name, :last_name, :address, :city, :state, :country, :zip, :telephone, :email, :card_token)
    end
    def stripe_params
      params.permit :stripeEmail, :stripeToken
    end
end
