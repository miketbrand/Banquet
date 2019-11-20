# Add a declarative step here for populating the DB with movies.

Given /the following banquets exist/ do |banquets_table|
  banquets_table.hashes.each do |banquet|
    Banquet.create!(banquet)
  end
end

Then /(.*) seed banquets should exist/ do | n_seeds |
  Banquet.count.should be n_seeds.to_i
end
