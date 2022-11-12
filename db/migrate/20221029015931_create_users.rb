class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.string :password
      t.boolean :is_admin, default: false
      t.timestamps null: false
    end
  end
end
