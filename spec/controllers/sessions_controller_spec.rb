require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
	describe "#new" do
		before { get :new}

		it 'returns 200' do
			expect(response).to be_success
		end
	end

	describe "#create" do
		context 'valid params' do
			before do
				post :create, superuser: {
					email: 'email@admin.com', password_digest: '38299efu0fjhgfadhf9023fd'
				} 
			end

			it 'assigns @superuser' do
				expect(assigns(:superuser)).to be_a Superuser
			end
		end

	end

end


