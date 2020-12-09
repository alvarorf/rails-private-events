class User < ApplicationRecord
  validates :name, presence: true, uniqueness: false, length: { in: 4...100 }
  validates :username, presence: true, uniqueness: true, length: { in: 5...254 }
  validates :email, presence: true, uniqueness: true, length: { in: 10..254 }, format:
  {
    with: URI::MailTo::EMAIL_REGEXP
  }
  has_secure_password
  has_many :events, dependent: :destroy, foreign_key: :user_id
  has_many :attendances, dependent: :destroy
  has_many :attended_events, through: :attendances, source: :event
end
