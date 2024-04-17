# frozen_string_literal: true

class Sidecar::Logging
  class << self
    def run
      log_line = SecureRandom.random_bytes(1024)

      (1..100).each { |i|
        if i % 10 == 0
          Sidecar::Logger.error(log_line)
        else
          Sidecar::Logger.info(log_line)
        end

        sleep 1
      }

      # bucket.put_object(key: "sidecar/#{id}/stdout.log", body: File.open("/var/log/stdout-#{file_index}.log"))
    end
  end
end
