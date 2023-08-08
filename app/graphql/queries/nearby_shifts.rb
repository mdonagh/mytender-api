module Queries
  class NearbyShifts < Queries::BaseQuery
    type Types::CustomTypes::Shift.connection_type, null: false

    def resolve(latitude:, longitude:)
      # This is bad math... I dunno if I should just save calculated end time so that it
      # is easier to query

      puts "GOT HERE"
      puts latitude
      puts longitude

      if !context[:user].seeded
        context[:user].update(seeded: true)
        Seed.populate(latitude, longitude)
      end

      result = Shift.near([latitude, longitude], 2, units: :km)
      # .where("start_time > ?", Time.now - 8.hours)
      # .where("start_time < ?", Time.now + 8.hours)
      ap result
      result
    end
  end
end
