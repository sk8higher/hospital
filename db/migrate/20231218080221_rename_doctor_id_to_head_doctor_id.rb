class RenameDoctorIdToHeadDoctorId < ActiveRecord::Migration[7.0]
  def change
    rename_column :departments, :doctor_id, :head_doctor_id
  end
end
