module Mutations
  module User
    class Create < Mutations::BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true

      field :user, Types::CustomTypes::User, null: false
      field :token, String, null: false

      def resolve(**attributes)
        user = User.create!(attributes)
        token = AuthToken.token(user)

        { user: user, token: token }
      end
    end
  end
end
