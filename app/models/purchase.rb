class Purchase < ActiveRecord::Base
	after_create :email_purchaser


	validates_presence_of :first_name, :last_name, :address, :city, :state, :country, :zip, :email


  def add_ship_date
    update_attribute(:shipped, DateTime.now)
  end

	private

	def email_purchaser
	   PurchaseMailer.purchase_receipt(self).deliver
	end

end
