Feature: display list of Restaurants

  As a user,
  I could see the details of restaurants.
  I could add, edit or delete restaurants. 

Background: Restaurants have been added to database

  Given the following users exist:
    | id | email                   | password  | username     | email_confirmed | is_admin |
    | 1  | confirmed@columbia.edu  | 1234      | test         | true            | true     |

  Given the following restaurants exist:
  | name                   | rating | address | details  |
  | Shake Shack            | Good   | 2957 Broadway, New York, NY 10025  | American food  |
  | Absolute Bagels        | Good   | 108th St & End Ave Manhattan Valley  | American food  |
  | Thai Market            | Good   | 960 Amsterdam Ave New York, NY 10025  | Thai food  |
  | Saiguette              | Good   | 935 Columbus Ave New York, NY 10025  | Vietnam food  |
  | Amy ruth's             | Good   | 113 W 116th St New York, NY 10026   | Korean food  |

  And  I am on the home page
  Then 5 restaurants should exist

  Given the following timeslots exist:
  | restaurant_id | user_id |    status   | start_time             | max_number |
  | 1             | 2       | 'Completed' | '2022-10-11 12:37:00'  |  6         |
  | 1             | 1       | 'Completed' | '2022-10-11 12:37:00'  |  6         |

  Given the following guests exist:
  | timeslot_id   | user_id |    
  | 2             | 2       | 

Scenario: check restaurants list
  Given I am on the home page 
  Then I should see "Shake Shack"
  And I should see "Absolute Bagels"
  And I should see "Thai Market"
  And I should see "Saiguette"
  And I should see "Amy ruth's"

Scenario: check restaurant details
  When I press "Detail" with the id of "Shake Shack"
  Then I am on the details page for "Shake Shack"



Scenario: add new restaurant
  Given I am on the home page
  When I press "New Restaurant"
  Then I am on the new page
  And I fill in "restaurant_name" with "KFC" 
  And I press "Create Restaurant"
  Then I should see "Restaurant was successfully created."

Scenario: revise and update restaurant information
  Given I am on the home page
  When I press "Edit" with the id of "Saiguette"
  Then I am on the edit page for "Saiguette"
  And I fill in "restaurant_rating" with "Excellent"
  And I press "Update Restaurant"
  Then the rating of "Saiguette" should be "Excellent"
  And I should see "Restaurant was successfully updated."

Scenario: delete restaurant and rating
  Given I am on the home page 
  When I press "Destroy" with the id of "Thai Market"
  Then I should see "Restaurant was successfully destroyed."

Scenario: add reviews
  Given I am on the log in page
  And  I fill in "email" with "confirmed@columbia.edu"
  And  I fill in "password" with "1234"
  Then I press "Sign In"
  Then I should be on the home page
  Then I press "Detail" with the id of "Shake Shack"
  When I select "3" from "Rate the restaurant (5 to 1: Excellent to Bad):"
  When I fill in "Leave your comment" with "Interesting food"
  And I press "Submit review"
  Then I should see "Interesting food"

Scenario: fail to add empty reviews
  Given I am on the log in page
  And  I fill in "email" with "confirmed@columbia.edu"
  And  I fill in "password" with "1234"
  Then I press "Sign In"
  Then I should be on the home page
  Then I press "Detail" with the id of "Shake Shack"
  When I select "3" from "Rate the restaurant (5 to 1: Excellent to Bad):"
  When I fill in "Leave your comment" with ""
  And I press "Submit review"
  Then I should see "Please enter your comments."

Scenario: Join timeslot
  Given I am on the log in page
  And  I fill in "email" with "confirmed@columbia.edu"
  And  I fill in "password" with "1234"
  Then I press "Sign In"
  Then I should be on the home page
  Then I press "Detail" with the id of "Shake Shack"
  Then I press "Join" with the id of "2"
  Then I should see "Joined this timeslot successfully."

Scenario: Exit timeslot
  Given I am on the log in page
  And  I fill in "email" with "confirmed@columbia.edu"
  And  I fill in "password" with "1234"
  Then I press "Sign In"
  Then I should be on the home page
  Then I press "Detail" with the id of "Shake Shack"
  Then I press "Join" with the id of "2"
  Then I should see "Joined this timeslot successfully."
  Then I press "Exit" with the id of "2"
  Then I should see "Exited this timeslot successfully."

Scenario: Check the detail of timeslot
  Given I am on the log in page
  And  I fill in "email" with "confirmed@columbia.edu"
  And  I fill in "password" with "1234"
  Then I press "Sign In"
  Then I should be on the home page
  Then I press "Detail" with the id of "Shake Shack"
  Then I press "Join" with the id of "2"
  Then I should see "Joined this timeslot successfully."

Scenario: Create timeslot
  Given I am on the log in page
  And  I fill in "email" with "confirmed@columbia.edu"
  And  I fill in "password" with "1234"
  Then I press "Sign In"
  Then I should be on the home page
  Then I press "Detail" with the id of "Shake Shack"
  Then I press "New timeslot"
  Then I am on the new timeslot page
  And  I fill in "Max number" with "6"
  And  I fill in "start_time" with "11/20/2022 12:37 PM"
  Then I press "Create Timeslot" 
  Then I should see "This timeslot was successfully created."
  
Scenario: Detail timeslot
  Given I am on the log in page
  And  I fill in "email" with "confirmed@columbia.edu"
  And  I fill in "password" with "1234"
  Then I press "Sign In"
  Then I should be on the home page
  Then I press "Detail" with the id of "Shake Shack"
  Then I press "Detail" with the id of "1"
  Then I should see "Maximum"

Scenario: Delete timeslot
  Given I am on the log in page
  And  I fill in "email" with "confirmed@columbia.edu"
  And  I fill in "password" with "1234"
  Then I press "Sign In"
  Then I should be on the home page
  Then I press "Detail" with the id of "Shake Shack"
  Then I press "Delete" with the id of "1"
  Then I should see "Timeslot was successfully destroyed."

Scenario: Create timeslot with an invalid start time
  Given I am on the log in page
  And  I fill in "email" with "confirmed@columbia.edu"
  And  I fill in "password" with "1234"
  Then I press "Sign In"
  Then I should be on the home page
  Then I press "Detail" with the id of "Shake Shack"
  Then I press "New timeslot"
  Then I am on the new timeslot page
  And  I fill in "Max number" with "6"
  And  I fill in "start_time" with ""
  Then I press "Create Timeslot" 
  Then I should see "Please select a valid time slot."
