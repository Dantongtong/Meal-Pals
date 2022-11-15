Feature: profile update

  As a user
  I want to update my own profile

Background: users and corresponding profile in database

  Given the following users exist:
    | id | email                   | password  | username     | email_confirmed | is_admin |
    | 1  | confirmed@columbia.edu  | 1234      | test         | true            | true     |

  Given the following profiles exist:
    | id | user_id | phone     | first_name     |
    | 2  | 1       | 1234      | test           |

Scenario: success to update my profile
  Given I am on the profile page with id = 2
  And  I fill in "First Name" with "confirmed_first"
  And  I fill in "Phone" with "1234321"
  When I attach "Avatar" to "/app/assets/images/1.png"
  Then I press "Save changes"
  Then I should be on the profile page with id = 2
  And I should see "Update profile successfully"

Scenario: fail to update my profile
  Given I am on the profile page with id = 2
  And  I fill in "First Name" with "confirmed_first"
  And  I fill in "Phone" with "eeeeee"
  Then I press "Save changes"
  Then I should be on the profile page with id = 2
  And I should see "Failed to update"

Scenario: confirm account with a valid token
  Given I am on the my slots page with id = 1
  And I should see "My Slots"

Scenario: check admin
  Given I am on the log in page
  And  I fill in "email" with "confirmed@columbia.edu"
  And  I fill in "password" with "1234"
  Then I press "Sign In"
  Given I am on the profile page with id = 2
  And I should see "Role: admin"

