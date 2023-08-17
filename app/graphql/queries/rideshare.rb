module Queries
  class Rideshare < Queries::BaseQuery
    type Types::CustomTypes::Rideshare, null: false

    def resolve(lat:, lng:, shift_id:)
      Rails.logger.error("got here!!!")
      uber = Uber.new(lat, lng, shift_id)
      {uber: uber.uber, lyft: uber.lyft}
    end
  end
end
