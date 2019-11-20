Feature: display all events
 
  As a user
  So that I can manage the Banquets that I put on
  I want to see my Banquets

Background: events have been added to database

  Given the following banquets exist:
  | id  | hostID  | banquet_name        | zip_code  | start           | end             | entryPrice  | entryLimit  |
  | 1   | 1       | Taco Tuesday        | 12345     | 20080906171750  | 20800906171750  | 4.95        | 25          |
  | 2   | 2       | Thanksgiving Feast  | 76543     | 20180906171750  | 20200906171750  | 8.95        | 30          |
  | 3   | 2       | Backyard BBQ        | 12345     | 20180906171750  | 20200906171750  | 6.49        | 30          |

  And the following users exist:
  | id  | email                   | password  | first_name  | middle_name | last_name | zip_code  |
  | 1   | kimpossible@gmail.com   | rufus     | Kimberly    | Sara        | Possible  | 12345     |
  | 2   | ronstoppable@yahoo.com  | rufus     | Ronald      | Weasley     | Stoppable | 87654     |

  And the following transactions exist:
  | fromID  | toID  | banquetID | amount  |
  | 1       | 2     | 1         | 4.95    |
  | 2       | 1     | 2         | 8.95    |
  
  And I am on the login page

Scenario: Login in and view my transaction history
  When I fill in "user_login_email" with "kimpossible@gmail.com"
  And I fill in "user_login_password" with "rufus"
  And I press "Login"
  Then I should be on the profile page
  When I follow "Transaction History"
  Then I should be on the transaction history page
  And I should see "Taco Tuesday" before "Thanksgiving Feast"

Scenario: Purchasing entry to a banquet
  When I fill in "user_login_email" with "kimpossible@gmail.com"
  And I fill in "user_login_password" with "rufus"
  And I press "Login"
  Then I should be on the profile page
  When I follow "Transaction History"
  Then I should be on the transaction history page
  And I should not see "Backyard BBQ"
  When I follow "Find Banquets"
  Then I should be on the find banquets page
  And I should see "Taco Tuesday"
  And I should see "Backyard BBQ"
  When I follow "RSVP to Backyard BBQ"
  Then I should be on the transaction history page
  And I should see "Backyard BBQ" before "Thanksgiving Feast"