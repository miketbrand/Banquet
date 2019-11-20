# spec/models/user_spec.rb
require 'rails_helper'

describe User do
  it 'can be created' do
    expect(User.create()).to be_valid
  end
end