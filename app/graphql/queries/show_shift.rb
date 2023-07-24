module Queries
  class ShowShift < Queries::BaseQuery
    type Types::CustomTypes::Shift, null: false

    def resolve(id:)
      Shift.find(id)
    end
  end
end
