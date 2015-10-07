require 'rails_helper'

RSpec.describe Purchase, type: :model do

 describe "Attributes" do
     it { is_expected.to respond_to :amount }
     it { is_expected.to respond_to :email }
     it { is_expected.to respond_to :description }
     it { is_expected.to respond_to :currency }
     it { is_expected.to respond_to :customer_id }
     it { is_expected.to respond_to :card }
     it { is_expected.to respond_to :product_id }
 end
end