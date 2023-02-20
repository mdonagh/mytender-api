require 'rails_helper'

describe 'List Shifts', type: :request do
  let!(:user) { create(:user) }

  let(:near_request) do
    <<~GQL
      query {
        shifts(near: [47.6205131, -122.34930359883187]) {
          nodes {
            id
          }
        }
      }
    GQL
  end

  let(:personal_request) do
    <<~GQL
      query {
        shifts(personal: true) {
          nodes {
            id
          }
        }
      }
    GQL
  end

  it 'can return nearby shifts' do
    first = FactoryBot.create(:shift, latitude: 0.4787e2, longitude: -0.1221e3, user: user)
    second = FactoryBot.create(:shift, latitude: 0.4787e2, longitude: -0.1221e3, user: user)
    graphql_request(near_request,
                    headers: auth_headers(user)
                    )
    expect(json.dig(:data, :shifts, :nodes).map{|node| node[:id]}.map(&:to_i).sort)
      .to eq([first.id, second.id])
  end
  it 'can return personal shifts' do
    new_user = create(:user)

    FactoryBot.create(:shift, latitude: 0.4787e2, longitude: -0.1221e3, user: new_user)
    FactoryBot.create(:shift, latitude: 0.4787e2, longitude: -0.1221e3, user: new_user)
    FactoryBot.create(:shift, latitude: 0.4787e2, longitude: -0.1221e3)
    graphql_request(personal_request,
                    headers: auth_headers(new_user)
                    )
    ap response
    expect(json.dig(:data, :shifts, :nodes).count)
      .to eq(2)
  end
end
