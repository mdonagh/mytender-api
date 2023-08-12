require 'aws-sdk-s3'
# == Schema Information
#
# Table name: photos
#
#  id         :bigint           not null, primary key
#  bytes      :integer
#  kind       :integer
#  created_at :datetime         not null
#  user_id    :bigint           indexed
#
# Indexes
#
#  index_photos_on_user_id  (user_id)
#
class Photo < ApplicationRecord

  BUCKET_NAME = 'mytender-bucket'
  enum kind: [ :headshot, :banner ]

  after_create :denormalize_url

  def denormalize_url
    if headshot?
      user.update(headshot_url: url)
    elsif banner?
      user.update(banner_url: url)
    end
  end

  belongs_to :user

  def presigned_url
    bucket = Aws::S3::Bucket.new(BUCKET_NAME)
    bucket.object(s3_key).presigned_url(:put)

    # s3 = Aws::S3::Client.new(
    #   region:               'us-east-1',
    #   access_key_id:        ENV.fetch('AWS_KEY'),
    #   secret_access_key:    ENV.fetch('AWS_SECRET')
    # )

    # Aws::S3::Presigner.new(client: s3).presigned_url(
    #   :put_object,
    #   bucket: bucket,
    #   key: s3_key,
    #   acl: "public-read"
    # )
  end

  def s3_key
    "#{Rails.env}/#{user_id}/#{self.class}-#{kind}-#{id}"
  end

  def url
    "https://s3.amazonaws.com/#{bucket}/#{s3_key}"
  end

  def bucket
    'mytender-bucket'
  end
end
