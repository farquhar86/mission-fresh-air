require 'rails_helper'

RSpec.describe Superuser, type: :model do
  let (:superuser) {Superuser.new}

  describe "::new" do
  	it "creates a new instance of a Superuser" do
  		expect(Superuser.new).to be_a Superuser
  	end
  end

   describe "Attributes" do
     it { is_expected.to respond_to :password_digest }
     it { is_expected.to respond_to :email }
   end
end


