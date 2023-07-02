module Types
  module CustomTypes
    class Presigned < Types::BaseObject
      field :url, String, null: false
      field :headers, GraphQL::Types::JSON, null: true
      field :signed_id, String, null: false
    end
  end
end
