# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

uk = Country.create!(name: 'United Kingdom', countryCode: 'uk')

Network.create!(
  name: 'Ubitricity',
  slug: 'ubitricity',
  url: 'https://www.ubitricity.co.uk/residential_charging/',
  country: uk
)

Network.create!(
  name: 'Polar Instant',
  slug: 'polar-instant',
  url: 'https://polarinstant.com/',
  country: uk
)

Network.create!(
  name: 'Polar Plus',
  slug: 'polar-plus',
  url: 'https://polar-network.com/',
  country: uk
)

Network.create!(
  name: 'Source London',
  slug: 'source-london',
  url: 'https://www.sourcelondon.net/',
  country: uk
)

Network.create!(
  name: 'ChargePlace Scotland',
  slug: 'chargeplace-scotland',
  url: 'https://chargeplacescotland.org/',
  country: uk
)

Network.create!(
  name: 'Pod Point',
  slug: 'pod-point',
  url: 'https://pod-point.com/',
  country: uk
)

Network.create!(
  name: 'ESB EV Solutions',
  slug: 'esb-ev-solutions',
  url: 'https://www.esb-evsolutions.co.uk/',
  country: uk
)

Network.create!(
  name: 'Osprey',
  slug: 'osprey',
  url: 'https://ospreycharging.co.uk/',
  country: uk
)
