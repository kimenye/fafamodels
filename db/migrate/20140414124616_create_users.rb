class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.date :date_of_birth
      t.string :gender_id
      t.integer :phone_number
      
      t.timestamps
    end
  end
end
