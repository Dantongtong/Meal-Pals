Feature: sign up

  As a new user
  I want to sign up to Meal Pal

Background: users in database

  Given the following users exist:
  | email                   | password  | username     | email_confirmed | confirm_token |
  | confirmed@columbia.edu  | 1234      | test         | false           | token         |

Scenario: sign up with invalid email
  Given I am on the sign up page
  And  I fill in "Columbia Email Address*" with "invalid.columbia.edu"
  And  I fill in "Password*" with "1234"
  And  I fill in "Username*" with "invalid"
  Then I press "Sign Up"
  And I should see "Email address is invalid or not a columbia email"

Scenario: sign up with non columbia email
  Given I am on the sign up page
  And  I fill in "Columbia Email Address*" with "valid@gmail.edu"
  And  I fill in "Password*" with "1234"
  And  I fill in "Username*" with "valid"
  Then I press "Sign Up"
  And I should see "Email address is invalid or not a columbia email"

Scenario: sign up with blank email
  Given I am on the sign up page
  And  I fill in "Username*" with "valid"
  And  I fill in "Password*" with "1234"
  Then I press "Sign Up"
  And I should see "Email can't be blank"

Scenario: sign up with blank password
  Given I am on the sign up page
  And  I fill in "Columbia Email Address*" with "valid@columbia.edu"
  And  I fill in "Username*" with "valid"
  Then I press "Sign Up"
  And I should see "Password can't be blank"

Scenario: sign up with blank username
  Given I am on the sign up page
  And  I fill in "Columbia Email Address*" with "valid@columbia.edu"
  And  I fill in "Password*" with "1234"
  Then I press "Sign Up"
  And I should see "Username can't be blank"

Scenario: sign up with password less than 3 characters
  Given I am on the sign up page
  And  I fill in "Columbia Email Address*" with "valid@columbia.edu"
  And  I fill in "Password*" with "12"
  And  I fill in "Username*" with "valid"
  Then I press "Sign Up"
  And I should see "Password is too short (minimum is 3 characters)"

Scenario: sign up with valid information
  Given I am on the sign up page
  And  I fill in "Columbia Email Address*" with "valid@columbia.edu"
  And  I fill in "Password*" with "1234"
  And  I fill in "Username*" with "valid"
  Then I press "Sign Up"
  Then I should be on the log in page
  And I should see "Please confirm your email address to continue"

Scenario: confirm account with a valid token
  Given I am on the email confirmation page with "token"
  Then I should be on the log in page
  And I should see "Welcome to Meal Pal!"

Scenario: confirm account with a invalid token
  Given I am on the email confirmation page with "invalid_token"
  Then I should be on the log in page
  And I should see "Sorry. User does not exist"