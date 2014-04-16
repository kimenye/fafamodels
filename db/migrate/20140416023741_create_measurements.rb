class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string :height
      t.string :eye_colour
      t.string :hair_colour
      t.string :skin_colour
      t.string :shoe_size
      t.string :neck
      t.string :suit_size
      t.string :shoulders
      t.string :shirt_size
      t.string :inside_leg_size
      t.string :bust
      t.string :bra_size
      t.string :waist
      t.string :hips
      t.string :dress_size
      t.string :clothing_size_age
      
      t.integer :user_id

      t.timestamps
    end
  end
end
