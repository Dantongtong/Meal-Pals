class CreateTimeslots < ActiveRecord::Migration
    def up
      create_table :timeslots do |t|
        t.int :resaurant_id
        t.int :owner
        t.int :guest
        t.datetime :start_time
      end
    end
  
    def down
      drop_table :timeslots
    end
  end