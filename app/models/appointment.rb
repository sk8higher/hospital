class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  belongs_to :department

  validates :patient_id, presence: true
  validates :doctor_id, presence: true
end
