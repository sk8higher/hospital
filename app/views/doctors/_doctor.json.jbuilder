json.extract! doctor, :id, :name, :specialization, :experience, :phone, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)
