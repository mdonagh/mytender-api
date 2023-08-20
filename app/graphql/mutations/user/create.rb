module Mutations
  module User

    class Create < Mutations::BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true
      argument :kind, String, required: true
      argument :description, String, required: false, default_value: "", replace_null_with_default: true
      argument :instagram, String, required: false
      argument :venmo, String, required: false
      argument :cashapp, String, required: false

      field :user, Types::CustomTypes::User, null: false
      field :token, String, null: false

      def resolve(**attributes)
        user = ::User.create!(kind: arguments[:kind].downcase.to_sym,
                              email: arguments[:email],
                              password: arguments[:password],
                              instagram: arguments[:instagram],
                              venmo: arguments[:venmo],
                              cashapp: arguments[:cashapp],
                             description: arguments[:description])

        token = AuthToken.token(user)

        { user: user, token: token }
      end
    end
  end
end
