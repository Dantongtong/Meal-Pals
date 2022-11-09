class CreateGuests < ActiveRecord::Migration
    def self.up
      create_table :guests do |t|
        t.belongs_to :timeslot
        t.belongs_to :user
      end
    end
  
    def self.down
      drop_table :guests
    end
  end