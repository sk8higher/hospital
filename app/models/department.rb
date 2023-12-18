class Department < ApplicationRecord
  belongs_to :doctor, foreign_key: 'head_doctor_id'
end
