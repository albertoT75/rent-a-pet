class Pet < ApplicationRecord
  belongs_to :user
  has_many :rents, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :breed, presence: true
  validates :age, presence: true
  validates :address, presence: true
end
