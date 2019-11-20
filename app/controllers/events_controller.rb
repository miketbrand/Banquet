class EventsController < ApplicationController

  def index
    @events = Event.all
    @events.each do |event|
      agg = Aggregate.find(event[:aggregate_id])
      event.aggType = agg[:aggType]
      event.aggStatus = agg[:aggStatus]
    end
  end

end