class Task < ApplicationRecord
  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
