Feature: display all events
 
  As a user
  So that I can use the app
  I want to create and login to an account

Background: a user has been added to database

  Given the following users exist:
  | email                 | password  | first_name  | middle_name | last_name | zip_code  |
  | kimpossible@gmail.com | rufus     | Kimberly    | Sara        | Possible  | 12345     |

  And  I am on the login page
  
Scenario: Correct email and password
  When I fill in "user_login_email" with "kimpossible@gmail.com"
  And I fill in "user_login_password" with "rufus"
  And I press "Login"
  Then I should be on the profile page
  And the "user_first_name" field should contain "Kimberly"
  And the "user_middle_name" field should contain "Sara"
  And the "user_last_name" field should contain "Possible"
  And the "user_zip_code" field should contain "12345"
  
Scenario: Incorrect email but correct password
  When I fill in "user_login_email" with "ronstoppable@yahoo.com"
  And I fill in "user_login_password" with "rufus"
  And I press "Login"
  Then I should be on the login page
  And I should see "Invalid email or password"
  And the "user_login_email" field should be empty
  And the "user_login_password" field should be empty
  And the "user_signup_email" field should be empty
  And the "user_signup_password" field should be empty
  
Scenario: Correct email but incorrect password
  When I fill in "user_login_email" with "kimpossible@gmail.com"
  And I fill in "user_login_password" with "pass1234"
  And I press "Login"
  Then I should be on the login page
  And I should see "Invalid email or password"
  And the "user_login_email" field should be empty
  And the "user_login_password" field should be empty
  And the "user_signup_email" field should be empty
  And the "user_signup_password" field should be empty
  
Scenario: Correctly create a user account
  When I fill in "user_signup_email" with "ronstoppable@yahoo.com"
  And I fill in "user_signup_password" with "rufus"
  And I press "Sign Up"
  Then I should be on the profile page
  And the "user_first_name" field should be empty
  And the "user_middle_name" field should be empty
  And the "user_last_name" field should be empty
  And the "user_zip_code" field should be empty
  
Scenario: Try to create a profile with an email that already has an associated account
  When I fill in "user_signup_email" with "kimpossible@gmail.com"
  And I fill in "user_signup_password" with "rufus"
  And I press "Sign Up"
  Then I should be on the login page
  And I should see "A profile already exists with that email address"
  And the "user_login_email" field should be empty
  And the "user_login_password" field should be empty
  And the "user_signup_email" field should be empty
  And the "user_signup_password" field should be empty