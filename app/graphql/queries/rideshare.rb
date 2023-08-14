module Queries
  class Rideshare < Queries::BaseQuery
    type Types::CustomTypes::Rideshare, null: false

    def resolve(lat:, lng:, shift_id:)
      RideShare.new(lat, lng, shift_id)
    end
  end
end
