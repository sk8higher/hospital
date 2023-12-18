json.extract! patient, :id, :name, :age, :gender, :address, :phone, :created_at, :updated_at
json.url patient_url(patient, format: :json)
