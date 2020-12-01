class Attendance < ApplicationRecord
  belongs_to :users
  belongs_to :events
end
