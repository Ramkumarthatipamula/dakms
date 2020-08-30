class Institute < User
  validates :institute_centre_name, presence: true
  validates :institute_centre_type, presence: true
  validates :location, presence: true
  validates :address, presence: true
  validates :mobile_number, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
