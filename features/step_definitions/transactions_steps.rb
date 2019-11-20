# Add a declarative step here for populating the DB with movies.

Given /the following transactions exist/ do |transactions_table|
  transactions_table.hashes.each do |transaction|
    Transaction.create!(transaction)
  end
end

Then /(.*) seed transactions should exist/ do | n_seeds |
  Transaction.count.should be n_seeds.to_i
end
