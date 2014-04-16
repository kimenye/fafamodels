class CreateBodySections < ActiveRecord::Migration
  def change
    create_table :body_sections do |t|
      t.string :name

      t.timestamps
    end
    
    #populate with initial gender
    %w(Head Top Bottom).each do |name|
      BodySection.find_or_create_by_name name
    end
  end
end
