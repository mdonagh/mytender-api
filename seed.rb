lat = 47.6205131
long = -122.34930359883187

for i in 0..500 do
  lat = lat + (rand(0.0001) * 0.001)
  long = long + (rand(0.0001) * 0.001)

  Shift.create(latitude: lat, longitude: long)
end