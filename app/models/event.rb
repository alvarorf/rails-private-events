class Event < ApplicationRecord
  validates :date, presence: true, uniqueness: false, length: { in: 4...100 }
  validates :location, presence: true, uniqueness: true, length: { in: 5...254 }
  has_and_belongs_to_many :users
end
