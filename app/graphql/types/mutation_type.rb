module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::User::Create
    field :delete_user, mutation: Mutations::User::Delete
    field :update_user, mutation: Mutations::User::Update
    field :sign_in_user, mutation: Mutations::User::SignIn

    field :create_shift, mutation: Mutations::Shift::Create
    field :delete_shift, mutation: Mutations::Shift::Delete
  end
end
