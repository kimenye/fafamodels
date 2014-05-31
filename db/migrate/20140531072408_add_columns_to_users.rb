class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :modelling_agency, :string
    add_column :users, :phone_number, :string
    add_column :users, :country, :string
    add_column :users, :town, :string
  end
end
