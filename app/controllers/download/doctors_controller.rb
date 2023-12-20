class Download::DoctorsController < ApplicationController
  def index
    respond_to do |format|
      format.zip { respond_with_zipped_doctors }
    end
  end

  private

  def respond_with_zipped_doctors
    compressed_filestream = Zip::OutputStream.write_buffer do |zos|
      zos.put_next_entry "doctors.xlsx"
      zos.print render_to_string(
                  layout: false, handlers: [:axlsx], formats: [:xlsx],
                  template: "download/doctors/doctors",
                  locals: { doctors: Doctor.all },
                )
    end

    compressed_filestream.rewind
    send_data compressed_filestream.read, filename: "doctors.zip"
  end
end