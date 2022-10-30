class CreateReviews < ActiveRecord::Migration
    def up
      create_table :reviews do |r|
        r.integer :restaurant_id
        r.integer :user_id
        r.integer :rating
        r.string :comment
        r.timestamps null: false
      end
    end
  
    def down
      drop_table :reviews
    end
  end