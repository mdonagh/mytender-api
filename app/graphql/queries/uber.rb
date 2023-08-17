module Queries
  class Uber < Queries::BaseQuery
    type Types::CustomTypes::Automobile, null: false

    def resolve(lat:, lng:, shift_id:)
      RideShare.new(lat, lng, shift_id)
    end
  end
end
