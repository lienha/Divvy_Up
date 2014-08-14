# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Tour.delete_all
Poi.delete_all

admin = User.create( username: 'admin', email: 'admin@gmail.com', password: 'password', password_confirmation: 'password')

Tour.create(name: 'Architecture Tour I', creator_id: admin.id, zoom: 17, 
  center: {lat: 41.8887255, lng: -87.6270584})

tour1 = admin.tours.first

# create some POIs for out tours
Poi.create( name: 'Tribune Tower', tour_id: tour1.id,
          description: 'The Tribune Tower is a neo-Gothic building located at 435 North Michigan Avenue in Chicago, Illinois, USA. It is the home of the Chicago Tribune and Tribune Company.', 
          image: 'assets/images/tribunetower2.jpg',
          location: {lat: 41.89046592218648, lng: -87.62356281280518})

