# frozen_string_literal: true

require 'securerandom'
require "aws-sdk-s3"

class Direct::Logging
  class << self
    def run
      log_line = SecureRandom.random_bytes(1024)
      logger = Direct::Logger.new

      (1..100).each { |i|
        if i % 10 == 0
          logger.error(log_line)
        else
          logger.info(log_line)
        end

        sleep 1
      }

      # bucket.put_object(key: "direct/#{id}/stdout.log", body: File.open("/var/log/stdout-#{file_index}.log"))
    end
  end
end
