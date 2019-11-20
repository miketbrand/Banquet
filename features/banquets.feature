Feature: display all events
 
  As a user
  So that I can manage the Banquets that I put on
  I want to see my Banquets

Background: events have been added to database

  Given the following banquets exist:
  | hostID  | banquet_name        | zip_code  | start           | end             | entryPrice  | entryLimit  |
  | 1       | Taco Tuesday        | 12345     | 20080906171750  | 20800906171750  | 4.95        | 25          |
  | 2       | Thanksgiving Feast  | 76543     | 20180906171750  | 20200906171750  | 8.95        | 30          |

  And the following users exist:
  | id  | email                 | password  | first_name  | middle_name | last_name | zip_code  |
  | 2   | kimpossible@gmail.com | rufus     | Kimberly    | Sara        | Possible  | 12345     |
  
  And  I am on the login page

Scenario: Login in and view existing banquets that I've created in the past.
  When I fill in "user_login_email" with "kimpossible@gmail.com"
  And I fill in "user_login_password" with "rufus"
  And I press "Login"
  Then I should be on the profile page
  When I follow "My Banquets"
  Then I should be on the my banquets page
  And I should see "Thanksgiving Feast"

Scenario: Login in and view banquets in my area.
  When I fill in "user_login_email" with "kimpossible@gmail.com"
  And I fill in "user_login_password" with "rufus"
  And I press "Login"
  Then I should be on the profile page
  When I follow "Find Banquets"
  Then I should be on the find banquets page
  And I should see "Taco Tuesday"
  
Scenario: Login in and create a banquet.
  When I fill in "user_login_email" with "kimpossible@gmail.com"
  And I fill in "user_login_password" with "rufus"
  And I press "Login"
  Then I should be on the profile page
  When I follow "New Banquet"
  Then I should be on the new banquet page
  When I fill in "banquet_name" with "Backyard BBQ"
  And I fill in "banquet_zip_code" with "34067"
  And I fill in "banquet_start" with "201912031000"
  And I fill in "banquet_end" with "201912031400"
  And I fill in "banquet_entryPrice" with "5.50"
  And I fill in "banquet_entryLimit" with "50"
  And I press "Submit"
  Then I should be on the my banquets page
  And I should see "Backyard BBQ"