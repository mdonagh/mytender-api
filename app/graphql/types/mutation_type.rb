module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::User::Create
    field :delete_user, mutation: Mutations::User::Delete
    field :update_user, mutation: Mutations::User::Update
    field :sign_in_user, mutation: Mutations::User::SignIn
    field :cancel_subscription, mutation: Mutations::User::CancelSubscription

    field :create_shift, mutation: Mutations::Shift::Create
    field :delete_shift, mutation: Mutations::Shift::Delete

    field :create_photo, mutation: Mutations::Photo::Create
  end
end
