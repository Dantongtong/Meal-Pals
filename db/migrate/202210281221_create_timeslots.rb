class CreateTimeslots < ActiveRecord::Migration
    def self.up
      create_table :timeslots do |t|
        t.belongs_to :restaurant
        t.datetime :start_time
        t.string :status
        t.integer :max_number
        t.belongs_to :user
      end
    end
  
    def self.down
      drop_table :timeslots
    end
  end