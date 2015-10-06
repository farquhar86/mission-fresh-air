require "spec_helper"
require "superuser"

describe Superuser do
	it "has a secure password" do 
		expect (has_secure_password).to eq true
	end
end

