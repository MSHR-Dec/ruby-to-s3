# frozen_string_literal: true

class Direct::AwsS3
  def initialize
    resource = Aws::S3::Resource.new(
      credentials: Aws::Credentials.new("dummy", "dummy"),
      region: "us-east-1",
      endpoint: "http://10.0.249.211:4566",
    )
    @bucket = resource.bucket("ruby-to-s3")
  end

  def upload(key, file)
    @bucket.put_object(key: key, body: file)
  end
end
