module Types
  module CustomTypes
    class Automobile < Types::BaseObject
      field :uber, String, null: true
      field :lyft, String, null: true
    end
  end
end
