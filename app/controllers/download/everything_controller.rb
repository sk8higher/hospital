class Download::EverythingController < ApplicationController
  def index
    respond_to do |format|
      format.zip { respond_with_all_zipped }
    end
  end

  private

  def respond_with_all_zipped
    compressed_filestream = Zip::OutputStream.write_buffer do |zos|
      zos.put_next_entry "appointments.xlsx"
      zos.print render_to_string(
                  layout: false, handlers: [:axlsx], formats: [:xlsx],
                  template: "download/appointments/appointments",
                  locals: { appointments: Appointment.all },
                )

      zos.put_next_entry "departments.xlsx"
      zos.print render_to_string(
                  layout: false, handlers: [:axlsx], formats: [:xlsx],
                  template: "download/departments/departments",
                  locals: { departments: Department.all },
                )

      zos.put_next_entry "doctors.xlsx"
      zos.print render_to_string(
                  layout: false, handlers: [:axlsx], formats: [:xlsx],
                  template: "download/doctors/doctors",
                  locals: { doctors: Doctor.all },
                )

      zos.put_next_entry "patients.xlsx"
      zos.print render_to_string(
                  layout: false, handlers: [:axlsx], formats: [:xlsx],
                  template: "download/patients/patients",
                  locals: { patients: Patient.all },
                )

      zos.put_next_entry "schedules.xlsx"
      zos.print render_to_string(
                  layout: false, handlers: [:axlsx], formats: [:xlsx],
                  template: "download/schedules/schedules",
                  locals: { schedules: Schedule.all },
                )
    end

    compressed_filestream.rewind
    send_data compressed_filestream.read, filename: "all.zip"
  end
end