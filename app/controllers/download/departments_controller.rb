class Download::DepartmentsController < ApplicationController
  def index
    respond_to do |format|
      format.zip { respond_with_zipped_departments }
    end
  end

  private

  def respond_with_zipped_departments
    compressed_filestream = Zip::OutputStream.write_buffer do |zos|
      zos.put_next_entry "departments.xlsx"
      zos.print render_to_string(
                  layout: false, handlers: [:axlsx], formats: [:xlsx],
                  template: "download/departments/departments",
                  locals: { departments: Department.all },
                )
    end

    compressed_filestream.rewind
    send_data compressed_filestream.read, filename: "departments.zip"
  end
end
