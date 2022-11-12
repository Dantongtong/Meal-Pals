class CreateUserprofiles < ActiveRecord::Migration
  def change
    create_table :userprofiles do |t|
      t.string :avatar
      t.date :birth
      t.string :phone
      t.string :preference
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
