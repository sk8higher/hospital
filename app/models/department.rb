class Department < ApplicationRecord
  belongs_to :doctor, foreign_key: 'head_doctor_id'

  validates :name, presence: true, length: { maximum: 50 }
  validates :head_doctor_id, presence: true
  validates :capacity, presence: true
end