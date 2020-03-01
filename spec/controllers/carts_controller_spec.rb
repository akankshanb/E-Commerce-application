require 'rails_helper'

RSpec.describe CartsController, type: :controller do
    context 'GET #index' do
		it 'returns a success response' do
			get :index
            expect(response).to render_template("index")
		end
	end


	context 'GET #show' do
		it 'returns a success response' do
			cart = create(:cart)
            visit cart_path(cart.id)
            expect(response).to render_template("show")
		end
	end 
end
