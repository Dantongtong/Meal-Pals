Feature: sign up

  As a new user
  I want to sign up to Meal Pal

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