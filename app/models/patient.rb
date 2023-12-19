class Patient < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :age, presence: true
  validates :gender, presence: true, length: { maximum: 10 }
  validates :address, presence: true, length: { maximum: 255 }
  validates :phone, presence: true, format: { with: /[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}/im }
end
