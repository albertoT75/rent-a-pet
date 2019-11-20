class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  # validates :price, presence: true, numericality: { greater_than: 0 }
  # price should be moved to Pet and removed from Rent
  validates :start_period, presence: true #, if: :valid_start_date?
  validates :end_period, presence: true #, if: :valid_end_date?
end

def valid_start_date?
  self[:start_period] >= Date.today
end

def valid_end_date?
  self[:end_period] > self[:start_period]
end

# def date_validation
#   if self[:end_period] < self[:start_period]
#     errors[:end_period] << "Error message"
#     return false
#   else
#     return true
#   end
# end


