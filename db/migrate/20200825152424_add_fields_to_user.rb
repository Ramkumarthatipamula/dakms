class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :institute_type, :string
    add_column :users, :institute_centre_name, :string
    add_column :users, :institute_centre_type, :string
  end
end
