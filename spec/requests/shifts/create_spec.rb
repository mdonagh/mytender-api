require 'rails_helper'

describe 'List Shifts', type: :request do
  let!(:user) { create(:user) }

  let(:mutation) do
    <<~GQL
      mutation {
        createShift(input: {notes: "woof",
                            address: "woof",
                            recurring: true,
                            duration: 5,
                            startTime: "2013-07-16T19:00:00Z",
                            latitude: 47.6205131,
                            longitude: -122.34930359883187}) {
          shift {
            id
            notes
            address
            startTime
            latitude
            longitude
          }
        }
      }
    GQL
  end

  it 'creates shift' do
    graphql_request(mutation)
    expect(json.dig(:data, :createShift, :shift).keys.sort).to eq([:address, :id, :latitude, :longitude, :notes, :startTime])
  end
end
