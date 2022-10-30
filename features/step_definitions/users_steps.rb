
Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create user
  end
end


And /^(?:|I )set the environment variable "(.*)" to "(.*)"$/ do |var, value|
  # ENV[var] = value
  default_url_options[:host] = value
end
