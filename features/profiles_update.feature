Feature: profile update

  As a user
  I want to update my own profile

Background: users and corresponding profile in database

  Given the following users exist:
    | id | email                   | password  | username     | email_confirmed |
    | 1  | confirmed@columbia.edu  | 1234      | test         | true            |

  Given the following profiles exist:
    | id | user_id | phone     | first_name     |
    | 2  | 1       | 1234      | test           |

Scenario: update my profile
  Given I am on the profile page with id = 2
  And  I fill in "First Name" with "confirmed_first"
  And  I fill in "Phone" with "1234321"
  Then I press "Save changes"
  Then I should be on the profile page with id = 2
  And I should see "Update profile successfully"
