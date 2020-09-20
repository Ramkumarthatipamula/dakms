class AddFieldToCropUploadFile < ActiveRecord::Migration[5.2]
  def change
    add_column :upload_files, :crop, :string
  end
end
