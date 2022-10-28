class CreateReviews < ActiveRecord::Migration
    def up
      create_table :reviews do |r|
        r.integer :resaurant_id
        r.integer :user_id
        r.integer :rating
        r.string :comment
      end
    end
  
    def down
      drop_table :reviews
    end
  end