module Mutations
  module User
    class Delete < Mutations::BaseMutation
      field :user, Types::CustomTypes::User, null: false

      def resolve
        user = ::User.find(context[:current_user]&.id)
        user.destroy!

        { user: user }
      end
    end
  end
end
