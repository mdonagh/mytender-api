module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::UserMutations::CreateUserMutation
    field :delete_user, mutation: Mutations::UserMutations::DeleteUserMutation
    field :update_user, mutation: Mutations::UserMutations::UpdateUserMutation
    field :sign_in_user, mutation: Mutations::UserMutations::SignInUserMutation

    field :create_shift, mutation: Mutations::Shift::Create
    field :delete_shift, mutation: Mutations::Shift::Delete
  end
end
