class Doctor < ApplicationRecord
  has_one :department

  validates :name, presence: true, length: { maximum: 30 }
  validates :specialization, presence: true, length: { maximum: 255 }
  validates :experience, presence: true, length: { maximum: 15 }
  validates :phone, presence: true, length: { maximum: 15 }, format: { with: /[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}/im }
end
