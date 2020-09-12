class AddDeciplinefieldtoInstitute < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :discipline, :string
    # add_column :upload_files, :discipline, :string
    add_column :upload_files, :file_type, :string
    add_column :upload_files, :duration_of_video, :string
    add_column :upload_files, :reason, :string
    remove_index :users, :name => :index_users_on_email
  end
end
