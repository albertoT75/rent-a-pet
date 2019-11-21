class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :start_period, presence: true
  validates :end_period, presence: true
  validate :valid_dates?

  def valid_dates?
    errors.add :end_period, 'must be after the beginning' unless end_period > start_period
    errors.add :start_period, 'must be after today' if start_period < Date.today
  end
end
