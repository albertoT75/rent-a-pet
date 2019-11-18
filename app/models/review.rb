class Review < ApplicationRecord
  belongs_to :rent

  validates :content, presence: true
end
