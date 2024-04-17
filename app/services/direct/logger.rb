# frozen_string_literal: true

class Direct::Logger
  MAX_FILE_SIZE = 10 * 1024
  UPLOAD_PERIOD = 60

  def initialize
    @file_idx = 1
    @upload_at = Time.now

    @id = rand(1..1000)
    @s3 = Direct::AwsS3.new
  end

  def info(msg)
    add_log(log_line("INFO", msg))
  end

  def error(msg)
    add_log(log_line("ERROR", msg))
  end

  private

  def log_line(severity, msg)
    "#{Time.now} [#{severity}] #{msg}"
  end

  def add_log(msg)
    File.open("/var/log/stdout-#{@file_idx}.log", "ab+") do |f|
      f.write(msg)
      next if f.size < MAX_FILE_SIZE and Time.now - @upload_at <= UPLOAD_PERIOD

      @s3.upload("direct/#{@id}/stdout.log", f)
      @file_idx += 1
      @upload_at = Time.now
    end
  end
end
