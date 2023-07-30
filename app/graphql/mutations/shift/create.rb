module Mutations
  module Shift
    class Create < Mutations::BaseMutation
      argument :notes, String, required: false
      argument :address, String, required: false
      argument :recurring, Boolean, required: false
      argument :duration, Int, required: true
      argument :start_time, GraphQL::Types::ISO8601DateTime, required: false
      argument :latitude, Float, required: false
      argument :longitude, Float, required: false

      field :shift, Types::CustomTypes::Shift, null: true

      def resolve(**attributes)
        params = attributes
        params[:user_id] = context[:user].id
        shift = ::Shift.create!(params)
        { shift: shift }
      end
    end
  end
end