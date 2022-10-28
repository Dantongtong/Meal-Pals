class CreateTimeslots < ActiveRecord::Migration
    def self.up
      create_table :timeslots do |t|
        t.integer :resaurant_id
        t.integer :owner
        t.integer :guest
        t.datetime :start_time
      end
    end
  
    def self.down
      drop_table :timeslots
    end
  end