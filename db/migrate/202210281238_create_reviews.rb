class CreateReviews < ActiveRecord::Migration
    def up
      create_table :reviews do |r|
        r.belongs_to :restaurant
        r.belongs_to :user
        r.integer :rating
        r.string :comment
        r.timestamps null: false
      end
    end
  
    def down
      drop_table :reviews
    end
  end