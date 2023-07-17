module Queries
  class Shifts < Queries::BaseQuery
    type Types::CustomTypes::Shift.connection_type, null: false

    def resolve(near: [], personal: false)
      if near.none? && !personal
        raise "Must specify location or personal shifts"
      end

      puts "GOT HERE"
      puts near
      if near.any?
        Shift.near(near, 50)
      elsif personal
        Shift.where(user: context[:current_user])
      end
    end
  end
end
