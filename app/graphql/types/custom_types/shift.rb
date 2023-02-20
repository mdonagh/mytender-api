module Types
  module CustomTypes
    class Shift < Types::BaseObject
      field :id, ID, null: false
      field :user, Types::CustomTypes::User, null: true
      field :notes, String, null: true
      field :address, String, null: true
      field :latitude, Float, null: true
      field :longitude, Float, null: true
      field :start_time, GraphQL::Types::ISO8601DateTime, null: true
    end
  end
end
