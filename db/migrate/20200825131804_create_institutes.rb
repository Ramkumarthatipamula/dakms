class CreateInstitutes < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pwd, :string
  end
end
