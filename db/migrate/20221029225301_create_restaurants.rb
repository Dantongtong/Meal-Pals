class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :rating
      t.string :address
      t.string :details

      t.timestamps null: false
    end
  end
end
