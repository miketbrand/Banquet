class Event < ActiveRecord::Base
    belongs_to :aggregate
    attr_reader :aggType, :aggStatus
    attr_writer :aggType, :aggStatus
end
