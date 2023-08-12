module Queries
  class NearbyShifts < Queries::BaseQuery
    type Types::CustomTypes::Shift.connection_type, null: false

    def resolve(latitude:, longitude:, radius: 2)
      # This is bad math... I dunno if I should just save calculated end time so that it
      # is easier to query

      puts "GOT HERE"
      puts latitude
      puts longitude

      if !context[:user].seeded
        context[:user].update(seeded: true)
        Seed.populate(latitude, longitude)
      end

      result = Shift.includes([:user]).near([latitude, longitude], radius, units: :km)

      if radius != 2
        result.each do |shift|
          shift.distance = shift.distance_to([latitude, longitude])
        end
      end

      # .where("start_time > ?", Time.now - 8.hours)
      # .where("start_time < ?", Time.now + 8.hours)
      ap result
      result
    end
  end
end
