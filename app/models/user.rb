class User < ApplicationRecord

  validades :name, presence: true, uniqueness: false, length: { in: 4...100 }
  validates :username, presence: true, uniqueness: true, length: { in: 5...254 }
  validates :email, presence: true, uniqueness: true, length: { in: 10..254 }, format:
  {
    with: URI::MailTo::EMAIL_REGEXP
  }
  validates :password, presence: true, length: { in: 8..30 }
  belongs_to :user
  has_many :attendances
  has_many :attendees, through: attendances
end
