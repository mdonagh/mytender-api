module Mutations
  module Shift
    class Create < Mutations::BaseMutation
      argument :notes, String, required: false
      argument :address, String, required: false
      argument :recurring, Boolean, required: false
      argument :duration, Integer, required: true
      argument :start_time, GraphQL::Types::ISO8601DateTime, required: false
      argument :latitude, Float, required: false
      argument :longitude, Float, required: false

      field :shift, Types::CustomTypes::Shift, null: true

      def resolve(**attributes)
        shift = ::Shift.create!(attributes)

        { shift: shift }
      end
    end
  end
end