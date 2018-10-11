class Tag < ApplicationRecord
  has_and_belongs_to_many :file_uploads
  validates :name, presence: true, uniqueness: true
end
