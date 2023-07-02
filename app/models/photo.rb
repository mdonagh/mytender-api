# == Schema Information
#
# Table name: photos
#
#  id         :bigint           not null, primary key
#  kind       :integer
#  created_at :datetime         not null
#  user_id    :bigint           indexed
#
# Indexes
#
#  index_photos_on_user_id  (user_id)
#
class Photo < ApplicationRecord
  enum status: [ :headshot, :banner ]

  def presigned_url
    s3 = Aws::S3::Client.new(
      region:               'us-east-1',
      access_key_id:        ENV.fetch('AWS_KEY'),
      secret_access_key:    ENV.fetch('AWS_SECRET')
    )

    Aws::S3::Presigner.new(client: s3).presigned_url(
      :put_object,
      bucket: 'mytender-bucket',
      key: s3_key
    )
  end

  def s3_key
    "#{Rails.env}/#{user_id}/#{self.class}/#{id}"
  end
end
