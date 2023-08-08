module Types
  module CustomTypes
    class Shift < Types::BaseObject
      field :id, ID, null: false
      field :user, Types::CustomTypes::User, null: true
      field :notes, String, null: true
      field :bar_name, String, null: true
      field :address, String, null: true
      field :latitude, String, null: true, method: :lat_as_string
      field :longitude, String, null: true, method: :long_as_string
      field :start_time, GraphQL::Types::ISO8601DateTime, null: true
    end
  end
end
