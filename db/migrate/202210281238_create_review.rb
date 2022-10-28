class CreateReviews < ActiveRecord::Migration
    def up
      create_table :reviews do |r|
        r.int :resaurant_id
        r.int :user_id
        r.int :rating
        r.string :comment
      end
    end
  
    def down
      drop_table :reviews
    end
  end