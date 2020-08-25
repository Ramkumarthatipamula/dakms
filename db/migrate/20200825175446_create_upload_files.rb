class CreateUploadFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :upload_files do |t|
      t.string :upload_type
      t.string :name
      t.string :title
      t.string :description
      t.string :location
      t.datetime :date
      t.string :scientist_name
      t.string :scientist_id
      t.string :status, default: "Pending"
      t.boolean :archive
      t.integer :upload_data_id
      t.integer :institute_id

      t.timestamps
    end
  end
end
