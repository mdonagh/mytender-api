module Types
  class QueryType < Types::BaseObject
    field :user, resolver: Queries::User
    field :nearby_shifts, resolver: Queries::NearbyShifts do
      argument :latitude, Float, required: true
      argument :longitude, Float, required: true
    end
    field :shifts, resolver: Queries::Shifts do
      argument :near, [Float], required: false
      argument :personal, Boolean, required: false
    end

    field :shift, resolver: Queries::ShowShift do
      argument :id, ID, required: true
    end
  end
end
