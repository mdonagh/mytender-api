class Rideshare

  UBER_CLIENT_ID = "vi216c6aXNHZBxp4Td4OmFADiYtSwWf3"
  LYFT_CLIENT_ID = "LYdnUr1OWKnh"

  def initialize(pickup_lat, pickup_long, shift_id)
    @pickup_lat = pickup_lat
    @pickup_long = pickup_long
    @shift = Shift.find(shift_id)
    @pickup_address = CGI.escape(Geocoder.search([@pickup_lat, @pickup_long]).first.address)
  end

# https://developer.uber.com/docs/riders/ride-requests/tutorials/deep-links/introduction
  def uber
    # must install uber client and query for product ID
    url = <<-UBER
      https://m.uber.com/ul/?
      client_id=#{UBER_CLIENT_ID}
      &action=setPickup
      &pickup[latitude]=#{@pickup_lat}
      &pickup[longitude]=#{@pickup_long}
      &pickup[nickname]=#{@pickup_address}
      &pickup[formatted_address]=#{@pickup_address}
      &dropoff[latitude]=#{@shift.latitude}
      &dropoff[longitude]=#{@shift.longitude}
      &dropoff[nickname]=#{@shift.bar_name}
    UBER

    url.delete(" \t\r\n")
  end

# https://developer.lyft.com/docs/universal-links
  def lyft
    url = <<-LYFT
      https://lyft.com/ride?
      id=lyft
      &pickup[latitude]=#{@pickup_lat}
      &pickup[longitude]=#{@pickup_long}
      &partner=#{LYFT_CLIENT_ID}
      &destination[latitude]=#{@shift.latitude}
      &destination[longitude]=#{@shift.longitude}
    LYFT

    url.delete(" \t\r\n")
  end
end
