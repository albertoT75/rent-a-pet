class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :pets, dependent: :destroy
  has_many :rents
  has_many :reviews, through: :rents
  has_many :rents_as_owner, through: :pets, source: :rents

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
