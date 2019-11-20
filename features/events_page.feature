Feature: display all events
 
  As an admin
  So that I can track occurances
  I want to see events displayed per order of their creation

Background: events have been added to database

  Given the following events exist:
  | aggregate_id    | eventType                 | eventData |
  | 1               | Banquet Creation          | 1         |
  | 1               | Certificate Confirmation  | True      |
  | 1               | Aggregate Closure         | nil       |
  | 2               | Banquet Creation          | 2         |
  | 2               | Certificate Confirmation  | False     |
  | 2               | Banquet Deletion          | 2         |
  | 2               | Aggregate Closure         | nil       |
  | 3               | Transaction Creation      | 1         |
  | 3               | Seat Reservation          | True      |
  | 3               | Aggregate Closure         | nil       |
  | 4               | Transaction Creation      | 2         |
  | 4               | Seat Reservation          | False     |
  | 4               | Transaction Deletion      | 2         |
  | 4               | Aggregate Closure         | nil       |

  And  I am on the events page
  Then 14 seed events should exist
