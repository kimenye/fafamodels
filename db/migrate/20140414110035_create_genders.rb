class CreateGenders < ActiveRecord::Migration
  def change
    create_table :genders do |t|
      t.string :name

      t.timestamps
    end
    
    #populate with initial gender
    %w(male female kids).each do |name|
      Gender.find_or_create_by_name name
    end
  end
end
