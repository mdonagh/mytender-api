module Mutations
  module Photo
    class Create < Mutations::BaseMutation
      field :filename, String, null: true
      field :byte_size, String, null: true
      field :checksum, Int, null: true
      field :content_type, String, null: true

      field :presigned, Types::CustomTypes::Presigned, null: true

      def resolve(**attributes)
        blob = ActiveStorage::Blob.create_before_direct_upload!(attributes)

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