class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :avatar
      t.integer :gender, default: 0
      t.date :birth
      t.string :phone
      t.string :preference
      t.integer :user_id, null: false
      t.timestamps null: false
    end
  end
end
