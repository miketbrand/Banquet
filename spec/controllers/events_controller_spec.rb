# spec/controllers/events_controller_spec.rb
require 'rails_helper'

describe EventsController do
    describe 'GET #index' do
        it 'populates an array of events' do 
            
        end
        
        it 'renders the :index view' do
            get :index
            expect(response).to render_template :index
        end
    end
end