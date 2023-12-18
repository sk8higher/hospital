class Schedule < ApplicationRecord
  belongs_to :doctor
  belongs_to :department

  validates :doctor_id, presence: true
  validates :department_id, presence: true
  validates :day_of_week, presence: true, length: { maximum: 15 }
  validates :start_time, presence: true
  validates :end_time, presence: true
end
