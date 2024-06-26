module Queries
  class Rideshare < Queries::BaseQuery
    type Types::CustomTypes::Rideshare, null: false

    def resolve(lat:, lng:, shift_id:)
      rideshare = ::Rideshare.new(lat, lng, shift_id)
      {uber: rideshare.uber, lyft: rideshare.lyft}
    end
  end
end
