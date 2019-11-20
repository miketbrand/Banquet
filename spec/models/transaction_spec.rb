# spec/models/transaction_spec.rb
require 'rails_helper'

describe Transaction do
  it 'can be created' do
    expect(Transaction.create()).to be_valid
  end
end