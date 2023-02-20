module Types
  class QueryType < Types::BaseObject
    field :user, resolver: Queries::User
    field :shifts, resolver: Queries::Shifts do
      argument :near, [Float], required: false
      argument :personal, Boolean, required: false
    end
  end
end
