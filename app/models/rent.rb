class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :start_period, presence: true, if: :valid_start_date?
  validates :end_period, presence: true, if: :valid_end_date?
end

# Implement the method
def valid_start_date?
  true
end

# Implement the method
def valid_end_date?
  true
end
