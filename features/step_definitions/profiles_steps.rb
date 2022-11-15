Given /the following profiles exist/ do |profiles_table|
  profiles_table.hashes.each do |profile|
    Profile.create profile
  end
end


And(/^I attach "(.*?)" to "(.*?)"$/) do |field, file|
  page.attach_file field, File.join(Rails.root.to_s, file)
end