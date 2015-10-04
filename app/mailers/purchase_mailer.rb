class PurchaseMailer < ActionMailer::Base
 layout 'purchase_mailer'

 default from: "Fresh Air Mission <fresh_air@fresh_air.com>"

 def purchase_receipt purchase
	 @purchase = purchase

	 mail to: purchase.email, subject: "Thanks for your purchase!"

  end

end
