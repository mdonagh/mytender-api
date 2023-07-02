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
        binding.pry

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