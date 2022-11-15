Feature: log in

  As a user
  I want to log in to Meal Pal

Background: users in database

  Given the following users exist:
  | id | email                   | password  | username     | email_confirmed |
  | 1  | confirmed@columbia.edu  | 1234      | test           | true            |
  | 2  | unconfirmed@columbia.edu| 1234      | bob            | false           |

Scenario: log in with incorrect email
  Given I am on the log in page
  And  I fill in "email" with "incorrect@columbia.edu"
  And  I fill in "password" with "1234"
  Then I press "Sign In"
  And I should see "Email or password is incorrect"

Scenario: log in with empty password
  Given I am on the log in page
  And  I fill in "email" with "confirmed@columbia.edu"
  Then I press "Sign In"
  And I should see "Email or password is incorrect"

Scenario: log in with incorrect password
  Given I am on the log in page
  And  I fill in "email" with "confirmed@columbia.edu"
  And  I fill in "password" with "12345"
  Then I press "Sign In"
  And I should see "Email or password is incorrect"

Scenario: log in with unconfirmed account
  Given I am on the log in page
  And  I fill in "email" with "unconfirmed@columbia.edu"
  And  I fill in "password" with "1234"
  Then I press "Sign In"
  And I should see "Please activate your account"

Scenario: log in with confirmed account
  Given I am on the log in page
  And  I fill in "email" with "confirmed@columbia.edu"
  And  I fill in "password" with "1234"
  Then I press "Sign In"
  Then I should be on the home page
  And I should see "Log in successfully!"

Scenario: click create account link
  Given I am on the log in page
  When  I follow "Create new account"
  Then I should be on the sign up page

Scenario: sign out
  Given I am on the sign out page with id = 1
  Then I should be on the home page
  And I should see "Log out successfully!"