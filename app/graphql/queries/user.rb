module Queries
  class User < Queries::BaseQuery
    type Types::CustomTypes::User, null: true

    def resolve
      context[:user]
    end
  end
end
