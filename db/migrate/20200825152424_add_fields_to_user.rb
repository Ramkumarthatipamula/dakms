class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :institute_centre_name, :string
    add_column :users, :institute_centre_type, :string
  end
end
