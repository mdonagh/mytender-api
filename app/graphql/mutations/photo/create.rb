require 'aws-sdk-s3'

module Mutations
  module Photo
    class Create < Mutations::BaseMutation
      argument :filename, String, required: false
      argument :byte_size, Int, required: false
      argument :checksum, String, required: false
      argument :content_type, String, required: false

      field :presigned, Types::CustomTypes::Presigned, null: true

      def resolve(**attributes)
        #credentials below for the IAM user I am using
        s3 = Aws::S3::Client.new(
          region:               'us-east-1', #or any other region
          access_key_id:        ENV.fetch('AWS_KEY'),
          secret_access_key:    ENV.fetch('AWS_SECRET')
        )

        signer = Aws::S3::Presigner.new(client: s3)
        url = signer.presigned_url(
          :put_object,
          bucket: 'mytender-bucket',
          key: Time.now.to_i.to_s
        )

        # blob = ActiveStorage::Blob.create_before_direct_upload!(**attributes)

        { presigned: {
            url: url,
            headers: {a: 'b'},
            signed_id: 'a'
          }
        }
      end
    end
  end
end