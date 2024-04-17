# frozen_string_literal: true

class Sidecar::Logger
  class << self
    def info(message)
      add_log(log_line("INFO", message))
    end

    def error(message)
      add_log(log_line("ERROR", message))
    end

    private

    def log_line(severity, msg)
      "#{Time.now} [#{severity}] #{msg}"
    end

    def add_log(msg)
      File.open("/var/log/stdout.log", "ab+") do |f|
        f.write(msg)
      end
    end
  end
end
