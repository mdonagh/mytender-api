module Mutations
  module User
    class SignIn < Mutations::BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true

      field :user, Types::CustomTypes::User, null: true
      field :token, String, null: true

      def resolve(**attributes)
        user = ::User.find_by(email: attributes[:email])

        unless user&.authenticate(attributes[:password])
          raise GraphQL::ExecutionError, I18n.t('errors.invalid_credentials')
        end

        token = AuthToken.token(user)
        { user: user, token: token }
      end
    end
  end
end
