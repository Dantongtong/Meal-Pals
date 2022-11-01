Given /the following timeslots exist/ do |timeslots_table|
    timeslots_table.hashes.each do |timeslot|
      Timeslot.create timeslot
    end
end