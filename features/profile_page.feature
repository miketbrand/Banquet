Feature: display all events
 
  As a user
  So that I can use the app more easily
  I want to see and customize my profile

Background: events have been added to database

  Given the following users exist:
  | email                 | password  | first_name  | middle_name | last_name | zip_code  |
  | kimpossible@gmail.com | rufus     | Kimberly    | Sara        | Possible  | 12345     |

  And  I am on the login page
  Then 1 seed users should exist

Scenario: Login and attempt to update profile information
  When I fill in "user_login_email" with "kimpossible@gmail.com"
  And I fill in "user_login_password" with "rufus"
  And I press "Login"
  Then I should be on the profile page
  When I fill in "user_first_name" with "Ronald"
  And I fill in "user_middle_name" with "McDonald"
  And I fill in "user_last_name" with "Stoppable"
  And I fill in "user_zip_code" with "23456"
  And I press "Update Profile Info"
  Then I should be on the profile page
  And the "user_first_name" field should contain "Ronald"
  And the "user_middle_name" field should contain "McDonald"
  And the "user_last_name" field should contain "Stoppable"
  And the "user_zip_code" field should contain "23456"