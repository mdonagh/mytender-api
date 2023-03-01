module Types
  module CustomTypes
    class User < Types::BaseObject
      field :id, ID, null: false
      field :email, String, null: false
    end
  end
end
