# spec/controllers/users_controller_spec.rb
require 'rails_helper'

describe UsersController do
    describe 'GET #login' do
        it 'renders the :login view' do
            get :login
            expect(response).to render_template :login
        end
    end
end