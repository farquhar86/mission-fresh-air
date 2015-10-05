class Superuser < ActiveRecord::Base
	has_secure_password

	def self.confirm(params)
	    superuser = Superuser.find_by_email(params[:email])
	    superuser.try(:authenticate, params[:password])
  	end
end
