class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  # validates :price, presence: true, numericality: { greater_than: 0 }
  # price should be moved to Pet and removed from Rent
  validates :start_period, presence: true, if: :valid_start_date?
  validates :end_period, presence: true, if: :valid_end_date?
end

def valid_start_date?
  :start_period >= Date.today
end

def valid_end_date?
  :end_period > :start_period
end
