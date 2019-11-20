# spec/controllers/transactions_controller_spec.rb
require 'rails_helper'

describe TransactionsController do
    describe 'GET #show' do
        it 'redirects to login when attempting #show unless already logged in' do
            get :show
            expect(response).to redirect_to(:login)
        end
    end
end