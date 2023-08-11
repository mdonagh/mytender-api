module Types
  module CustomTypes
    class User < Types::BaseObject
      field :id, ID, null: false
      field :email, String, null: false
      field :kind, String, null: false
      field :banner_url, String, null: true
      field :headshot_url, String, null: true
      field :description, String, null: true
    end
  end
end
