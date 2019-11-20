
aggregates = [{:aggType => 'hosting', :aggStatus => 'Closed'},
              {:aggType => 'hosting', :aggStatus => 'Closed'},
              {:aggType => 'purchase', :aggStatus => 'Closed'},
              {:aggType => 'purchase', :aggStatus => 'Closed'},
    ]
    
events = [['Banquet Creation', '1'],
          ['Certificate Confirmation', 'True'],
          ['Aggregate Closure', nil],
          ['Banquet Creation', '2'],
          ['Certificate Confirmation', 'False'],
          ['Banquet Deletion', '2'],
          ['Aggregate Closure', nil],
          ['Transaction Creation', '1'],
          ['Seat Reservation', 'True'],
          ['Aggregate Closure', nil],
          ['Transaction Creation', '2'],
          ['Seat Reservation', 'False'],
          ['Transaction Deletion', '2'],
          ['Aggregate Closure', nil],
    ]


Aggregate.delete_all
Event.delete_all

temp = 0

aggregates.each do |aggregate|
    agg = Aggregate.create(aggregate)
    agg.save!
    Event.create!( aggregate_id: agg.id, eventType: events[(temp*3.5).floor][0], eventData: events[(temp*3.5).floor][1] )
    Event.create!( aggregate_id: agg.id, eventType: events[(temp*3.5).floor+1][0], eventData: events[(temp*3.5).floor+1][1] )
    Event.create!( aggregate_id: agg.id, eventType: events[(temp*3.5).floor+2][0], eventData: events[(temp*3.5).floor+2][1] )
    if(temp%2 == 1)
        Event.create!( aggregate_id: agg.id, eventType: events[(temp*3.5).floor+3][0], eventData: events[(temp*3.5).floor+3][1] )
    end
    temp = temp + 1
end

User.delete_all
Banquet.delete_all