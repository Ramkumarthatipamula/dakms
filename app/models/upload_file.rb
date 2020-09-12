class UploadFile < ApplicationRecord
  # validates :discipline, presence: true
  validates :upload_type, presence: true
  validates :file_type, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validate :file_format
  default_scope { with_attached_file }
  # validates :scientist_name, presence: true
  # validates :scientist_id, presence: true

  # has_many_attached :uploads
  belongs_to :institute
  has_one_attached :file


  def file_format
    if file.attached?
      if self.file_type == 'Image'
        if !file.blob.content_type.in?(%w(image/jpeg image/jpg image/png))
          file.purge_later
          errors.add(:file, 'format incorrect')
        # elsif image.blob.content_type.in?(%w(image/jpeg image/jpg image/png)) && image.blob.byte_size > (5 * 1024 * 1024) # Limit size 5MB
        #   image.purge_later
        #   errors.add(:file, 'The image oversize limited (5MB)')
        end
      elsif self.file_type == 'Video'
        if !file.blob.content_type.in?(%w(avi flv mkv video/x-matroska mov mp4))
          file.purge_later
          errors.add(:file, 'format incorrect')
        end
      elsif self.file_type == 'Audio'
        if !file.blob.content_type.in?(%w(audio/mpeg audio/x-mpeg audio/mp3 audio/x-mp3 audio/mpeg3 audio/x-mpeg3 audio/mpg audio/x-mpg audio/x-mpegaudio))
          file.purge_later
          errors.add(:file, 'format incorrect')
        end
      elsif self.file_type == 'Word' || self.file_type == 'PDF'
        if !file.blob.content_type.in?(%w(application/docx application/doc application/pdf application/xls application/odt application/msword application/ods pdf))
          file.purge_later
          errors.add(:file, 'format incorrect')
        end
      end
    elsif file.attached? == false
      file.purge_later
      errors.add(:file, 'The file required.')
    end
  end
end
