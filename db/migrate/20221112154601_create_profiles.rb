class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :avatar
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :gender, default: "Prefer not to say"
      t.date :birth
      t.string :phone
      t.string :preference
      t.integer :user_id, null: false
      t.timestamps null: false
    end
  end
end
