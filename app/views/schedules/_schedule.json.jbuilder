json.extract! schedule, :id, :doctor_id, :department_id, :day_of_week, :start_time, :end_time, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
