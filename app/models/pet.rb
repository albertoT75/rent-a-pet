class Pet < ApplicationRecord
  belongs_to :user
  has_many :rents, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :name, presence: true
  validates :description, presence: true
  validates :breed, presence: true
  validates :age, presence: true
  validates :address, presence: true
  mount_uploader :photo, PhotoUploader
end
