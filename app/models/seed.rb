class Seed
  def self.populate(lat, lng)
    client = GooglePlaces::Client.new(ENV.fetch('GOOGLE_PLACES'))
    spots = client.spots(lat, lng, types: ['restaurant','bar'])
    spots.each do |spot|
      email = "#{Faker::Name.name.parameterize}@fake.invalid"
      password = SecureRandom.hex
      headshot_url =  "https://s3.amazonaws.com/mytender-bucket/development/6/Photo-headshot-12"
      banner_url =  "https://s3.amazonaws.com/mytender-bucket/development/6/Photo-banner-11"
      cashapp = "$markdonahue89"
      venmo = "Mark-Donahue-9"
      instagram = "bob_peters"
      user = User.create!(email: email,
                          password: password,
                          headshot_url: headshot_url,
                          cashapp: cashapp,
                          venmo: venmo,
                          instagram: instagram,
                          banner_url: banner_url,
                          description: Faker::Company.bs)
      Shift.create!(user: user,
                    notes: Faker::Company.bs,
                    latitude: spot.lat,
                    longitude: spot.lng,
                    start_time: Time.now,
                    address: spot.vicinity,
                    bar_name: spot.name)
    end
  end
end
