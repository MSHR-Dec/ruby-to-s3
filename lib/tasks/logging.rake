# frozen_string_literal: true

namespace :logging do
  desc "send logs directly to s3"
  task direct: :environment do
    Direct::Logging.run
  end

  desc "let sidecar help to send logs to s3"
  task :sidecar, [:oneshot] => :environment do |_, args|
    Sidecar::Logging.run(args[:oneshot])
  end
end
