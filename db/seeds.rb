require 'faker'
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

5.times do
	 User.create( username: Faker::Internet.user_name, email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
end

admin = User.create( username: 'admin', email: 'admin@gmail.com', password: 'password', password_confirmation: 'password')


Tour.create(name: 'Architecture Tour', creator_id: admin.id, zoom: 17, 
  center: {lat: 41.8887255, lng: -87.6270584}.to_json)

Tour.create(name: 'Party Tour', creator_id: 1, zoom: 17, 
  center: {lat: 41.8887255, lng: -87.6270584}.to_json)

Tour.create(name: 'Crime and Mob Tour', creator_id: 2, zoom: 17, 
  center: {lat: 41.8887255, lng: -87.6270584}.to_json)

Tour.create(name: 'Film Tour', creator_id: 3, zoom: 17, 
  center: {lat: 41.8887255, lng: -87.6270584}.to_json)

Tour.create(name: 'City Tour', creator_id: 4, zoom: 17, 
  center: {lat: 41.8887255, lng: -87.6270584}.to_json)

Tour.create(name: 'Grand Tour', creator_id: 5, zoom: 17, 
  center: {lat: 41.8887255, lng: -87.6270584}.to_json)


tour1 = admin.tours.first

# create some POIs for our tours
Poi.create( name: 'Tribune Tower', tour_id: tour1.id,
          description: 'The Tribune Tower is a neo-Gothic building located at 435 North Michigan Avenue in Chicago, Illinois, USA. It is the home of the Chicago Tribune and Tribune Company.', 
          image: 'assets/images/tribunetower2.jpg',
          location: {lat: 41.89046592218648, lng: -87.62356281280518}.to_json)
Poi.create( name: 'Wrigley Building',
          description: "The Wrigley Building is a skyscraper located directly across Michigan Avenue from the Tribune Tower on the Magnificent Mile. It was built to house the corporate headquarters of the Wrigley Company.",
          image: "assets/images/wrigley.jpg",
          location: {lat: 41.889379709685485, lng: -87.62463569641113}.to_json)
Poi.create( name: 'Trump Tower',
          description: "The Wrigley Building is a skyscraper located directly across Michigan Avenue from the Tribune Tower on the Magnificent Mile. It was built to house the corporate headquarters of the Wrigley Company.",
          image: "assets/images/wrigley.jpg",
          location: {lat: 41.889379709685485, lng: -87.62463569641113}.to_json)
Poi.create( name: 'Marina City',
          description: "Marina City is a mixed-use residential/commercial building complex that occupies an entire city block on State Street in Chicago, Illinois. The complex consists of two corncob-shaped, 587-foot (179 m), 65-story towers.",
          image: "assets/images/marina_city.jpg",
          location: {lat: 41.889379709685485, lng: -87.62463569641113}.to_json)



