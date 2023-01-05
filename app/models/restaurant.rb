class Restaurant < ApplicationRecord
  has_many :ratings
  validates :name, uniqueness: true, presence: true
end
