# spec/models/aggregate_spec.rb
require 'rails_helper'

describe Aggregate do
  it 'can be created' do
    expect(Aggregate.create()).to be_valid
  end
end