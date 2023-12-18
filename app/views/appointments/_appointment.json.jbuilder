json.extract! appointment, :id, :patient_id, :doctor_id, :department_id, :appointment_date, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
