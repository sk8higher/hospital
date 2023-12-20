class Download::PatientsController < ApplicationController
  def index
    respond_to do |format|
      format.zip { respond_with_zipped_patients }
    end
  end

  private

  def respond_with_zipped_patients
    compressed_filestream = Zip::OutputStream.write_buffer do |zos|
      zos.put_next_entry "patients.xlsx"
      zos.print render_to_string(
                  layout: false, handlers: [:axlsx], formats: [:xlsx],
                  template: "download/patients/patients",
                  locals: { patients: Patient.all },
                )
    end

    compressed_filestream.rewind
    send_data compressed_filestream.read, filename: "patients.zip"
  end
end