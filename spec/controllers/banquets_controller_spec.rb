# spec/controllers/banquets_controller_spec.rb
require 'rails_helper'

describe BanquetsController do
    describe 'GET #show' do
        it 'renders the :login view unless already logged in' do
            get :show
            expect(response).to redirect_to(:login)
        end
    end
end