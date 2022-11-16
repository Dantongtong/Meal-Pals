Given /the following profiles exist/ do |profiles_table|
  profiles_table.hashes.each do |profile|
    Profile.create profile
  end
end


And(/^I attach "(.*?)" to "(.*?)"$/) do |field, file|
  # f = fixture_file_upload( File.join(Rails.root.to_s, file), "image/png")
  page.attach_file field, File.join(Rails.root.to_s, file)

  # puts "path: " + f
end