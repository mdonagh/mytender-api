require 'aws-sdk-s3'

Aws.config.update(
  credentials: Aws::Credentials.new(ENV['AWS_KEY'], ENV['AWS_SECRET']),
  region: ENV['AWS_REGION'].presence || 'us-east-1',
)
