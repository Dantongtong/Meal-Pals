# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home page$/ then root_path
    when /^the log in page$/ then new_session_path
    when /^the sign up page$/ then new_user_path
    when /^the email confirmation page with "(.*)"$/ then confirm_email_user_url($1)
    when /^the sign out page with id = (.*)$/ then logout_session_path($1.to_i)
    when /^the profile page with id = (.*)$/ then edit_profile_path($1.to_i)
    when /^the my slots page with id = (.*)$/ then slots_session_path($1.to_i)
    when /^the edit page for "(.*)"$/
      restaurant = Restaurant.find_by(name: $1)
      edit_restaurant_path(restaurant)
    when /^the details page for "(.+)"$/
      restaurant = Restaurant.find_by(name: $1)
      restaurant_path(restaurant)
    when /^the new timeslot page$/ then new_timeslot_path
    when /^the new page$/ then new_restaurant_path
      
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
