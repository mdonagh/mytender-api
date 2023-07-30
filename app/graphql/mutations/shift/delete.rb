module Mutations
  module Shift
    class Delete < Mutations::BaseMutation
      argument :id, ID, required: false

      field :deleted, Boolean, null: true

      def resolve(id:)
        shift = ::Shift.find(id)
        shift.destroy!
        { deleted: true }
      end
    end
  end
end