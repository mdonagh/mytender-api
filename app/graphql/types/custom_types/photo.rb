module Types
  module CustomTypes
    class Photo < Types::BaseObject
      field :id, ID, null: false
      field :email, String, null: false
      field :user, Types::CustomTypes::User, null: false
    end
  end
end
