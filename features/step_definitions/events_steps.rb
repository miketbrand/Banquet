# Add a declarative step here for populating the DB with movies.

Given /the following events exist/ do |events_table|
  events_table.hashes.each do |event|
    Event.create!(event)
  end
end

Given /the following aggregates exist/ do |aggregates_table|
  aggregates_table.hashes.each do |aggregate|
    Aggregate.create!(aggregate)
  end
end

Then /(.*) seed events should exist/ do | n_seeds |
  Event.count.should be n_seeds.to_i
end

Then /(.*) seed aggregates should exist/ do | n_seeds |
  Aggregate.count.should be n_seeds.to_i
end

Then /I should see all the events/ do
  event_table = Movie.all
  event_IDs = []
  aggregate_IDs = []
  event_types = []
  event_data = []
  event_table.each do |event|
    event_IDs.push(event.id)
    aggregate_IDs.push(event.aggregate_id)
    event_types.push(event.eventType)
    event_data.push(event.eventData)
  end
  event_IDs.each do |id|
    step %Q{I should see "#{id}"}
  end
  aggregate_IDs.each do |id|
    step %Q{I should see "#{id}"}
  end
  event_types.each do |type|
    step %Q{I should see "#{type}"}
  end
  event_data.each do |datum|
    step %Q{I should see "#{datum}"}
  end
end