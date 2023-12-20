class Download::SchedulesController < ApplicationController
  def index
    respond_to do |format|
      format.zip { respond_with_zipped_schedules }
    end
  end

  private

  def respond_with_zipped_schedules
    compressed_filestream = Zip::OutputStream.write_buffer do |zos|
      zos.put_next_entry "schedules.xlsx"
      zos.print render_to_string(
                  layout: false, handlers: [:axlsx], formats: [:xlsx],
                  template: "download/schedules/schedules",
                  locals: { schedules: Schedule.all },
                )
    end

    compressed_filestream.rewind
    send_data compressed_filestream.read, filename: "schedules.zip"
  end
end
