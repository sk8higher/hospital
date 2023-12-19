class Download::AppointmentsController < ApplicationController
  def index
    respond_to do |format|
      format.zip { respond_with_zipped_appointments }
    end
  end

  private

  def respond_with_zipped_appointments
    compressed_filestream = Zip::OutputStream.write_buffer do |zos|
      zos.put_next_entry "appointments.xlsx"
      zos.print render_to_string(
                  layout: false, handlers: [:axlsx], formats: [:xlsx],
                  template: "download/appointments/appointments",
                  locals: { appointments: Appointment.all },
                )
    end

    compressed_filestream.rewind
    send_data compressed_filestream.read, filename: "appointments.zip"
  end
end