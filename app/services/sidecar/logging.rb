# frozen_string_literal: true

class Sidecar::Logging
  class << self
    def run(oneshot)
      log_line = SecureRandom.random_bytes(1024)

      if oneshot == "true"
        (1..100).each { |i|
          if i % 10 == 0
            Sidecar::Logger.error(log_line)
          else
            Sidecar::Logger.info(log_line)
          end

          sleep 1
        }
      else
        i = 1
        while true do
          if i % 10 == 0
            Sidecar::Logger.error(log_line)
          else
            Sidecar::Logger.info(log_line)
          end

          i += 1
          sleep 10
        end
      end
    end
  end
end
