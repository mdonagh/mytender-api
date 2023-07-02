module Mutations
  module Photo
    class Create < Mutations::BaseMutation
      argument :filename, String, required: false
      argument :byte_size, Int, required: false
      argument :checksum, String, required: false
      argument :content_type, String, required: false

      field :presigned, Types::CustomTypes::Presigned, null: true

      def resolve(**attributes)
        blob = ActiveStorage::Blob.create_before_direct_upload!(**attributes)

        { presigned: {
            url: blob.service_url_for_direct_upload(expires_in: 10.minutes),
            headers: blob.service_headers_for_direct_upload,
            signed_id: blob.signed_id 
          }
        }
      end
    end
  end
end
