module Mutations
  module User
    class CancelSubscription < Mutations::BaseMutation
      argument :reason, String, required: true

      field :user, Types::CustomTypes::User, null: false

      def resolve(**attributes)
        context[:user].update(cancellation_reason: arguments[:reason])
        ::Payment.cancel_subscription(context[:user])
        { user: context[:user] }
      end
    end
  end
end
