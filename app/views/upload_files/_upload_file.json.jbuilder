json.extract! upload_file, :id, :upload_type, :name, :title, :description, :location, :date, :scientist_name, :scientist_id, :status, :archive, :upload_data_id, :institute_id, :created_at, :updated_at
json.url upload_file_url(upload_file, format: :json)
