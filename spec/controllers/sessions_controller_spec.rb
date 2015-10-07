require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
	describe "#new" do
		before { get :new}

		it 'returns 200' do
			expect(response).to be_success
		end
	end
end


