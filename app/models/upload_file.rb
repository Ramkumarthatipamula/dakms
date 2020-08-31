class UploadFile < ApplicationRecord
  validates :upload_type, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :date, presence: true
  # validates :scientist_name, presence: true
  # validates :scientist_id, presence: true

  has_many_attached :uploads

end
