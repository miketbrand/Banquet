# spec/models/banquet_spec.rb
require 'rails_helper'

describe Banquet do
  it 'can be created' do
    expect(Banquet.create()).to be_valid
  end
end