require 'aws-sdk-s3'

module Mutations
  module Photo

    class Kind < Types::BaseEnum
      value "BANNER",
      value "HEADSHOT",
    end

    class Create < Mutations::BaseMutation
      argument :kind, Kind, required: true
      argument :bytes, Int, required: true

      field :url, String, null: true

      def resolve(**attributes)
        photo = Photo.create(user: context[:user],
                             kind: kind.downcase.to_sym,
                             bytes: bytes)
        { url: photo.presigned_url }
      end
    end
  end
end