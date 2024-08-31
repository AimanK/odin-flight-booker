# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Airport.create!([
  { code: 'SFO' },
  { code: 'NYC' },
  { code: 'LAX' },
  { code: 'ATL' },
  { code: 'ORD' },
  { code: 'MCO' }
])

# Find the airports by their codes
sfo = Airport.find_by(code: 'SFO')
nyc = Airport.find_by(code: 'NYC')
lax = Airport.find_by(code: 'LAX')
atl = Airport.find_by(code: 'ATL')
ord = Airport.find_by(code: 'ORD')
mco = Airport.find_by(code: 'MCO')

# Create some flight records, including flights to and from MCO
Flight.create!([
  { departure_airport: sfo, arrival_airport: nyc, start_datetime: DateTime.now + 3.days, duration: 360 },
  { departure_airport: lax, arrival_airport: atl, start_datetime: DateTime.now + 1.week, duration: 240 },
  { departure_airport: atl, arrival_airport: ord, start_datetime: DateTime.now + 5.days, duration: 120 },
  { departure_airport: ord, arrival_airport: sfo, start_datetime: DateTime.now + 2.days, duration: 300 },
  { departure_airport: nyc, arrival_airport: lax, start_datetime: DateTime.now + 4.days, duration: 420 },
  { departure_airport: mco, arrival_airport: sfo, start_datetime: DateTime.now + 6.days, duration: 360 }, # New Flight
  { departure_airport: nyc, arrival_airport: mco, start_datetime: DateTime.now + 7.days, duration: 180 }  # New Flight
])
