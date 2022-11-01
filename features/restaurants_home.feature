Feature: display list of Restaurants

  As a user,
  I could see the details of restaurants.
  I could add, edit or delete restaurants. 

Background: Restaurants have been added to database

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

  | restaurant_id | owner | guest | start_time               |
  | 1             | 1     |   2   |  '10-Nov-2022 12:00:00'  |


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
  Given I am on the home page
  Then I press "Detail" with the id of "Shake Shack"
  When I select "3" from "Rating"
  When I fill in "Comment" with "Interesting food"
  And I press "Submit review"
  Then I should see "Interesting food"

Scenario: Join timeslot


  Given I am on the home page
  Then I press "Detail" with the id of "Shake Shack"
  Then I press "Join" with the id of "1"
  Then I should see "Joined this timeslot successfully."

Scenario: Exit timeslot
  Given I am on the home page
  Then I press "Detail" with the id of "Shake Shack"
  Then I press "Exit" with the id of "1"
  Then I should see "Exited this timeslot successfully."
