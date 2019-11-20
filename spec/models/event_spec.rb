# spec/models/event_spec.rb
require 'rails_helper'

describe Event do
  it 'can be created' do
    expect(Event.create()).to be_valid
  end
end