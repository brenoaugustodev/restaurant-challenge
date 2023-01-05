class Rating < ApplicationRecord
  belongs_to :restaurant
  validates :user, uniqueness: true, presence: true
end
