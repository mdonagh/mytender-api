module Mutations
  module User
    class Update < Mutations::BaseMutation
      argument :email, String, required: false
      argument :password, String, required: false

      field :user, Types::CustomTypes::User, null: false

      def resolve(**attributes)
        user = ::User.find(context[:user]&.id)
        user.update!(attributes)

        { user: user }
      end
    end
  end
end
