class Event < ApplicationRecord
  validates :name, :description, :location, presence: true
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :attendances, foreign_key: 'attended_event_id', dependent: :destroy
  has_many :attendees, through: :attendances, source: :user
  scope :upcoming, -> { where('date > ?', Time.now) }
  scope :past, -> { where('date < ?', Time.now) }
end
