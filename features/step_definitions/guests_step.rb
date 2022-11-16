Given /the following guests exist/ do |guests_table|
    guests_table.hashes.each do |guest|
        Guest.create guest
    end
end