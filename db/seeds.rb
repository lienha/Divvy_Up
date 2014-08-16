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

users = []

5.times do |i|
	 users[i] = User.create( username: Faker::Internet.user_name, email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
end

admin = User.create( username: 'admin', email: 'admin@gmail.com', password: 'password', password_confirmation: 'password')


Tour.create(name: 'Architecture Tour', creator_id: admin.id, zoom: 17,
  center: {lat: 41.8887255, lng: -87.6270584}.to_json)

Tour.create(name: 'Sculpture Tour', creator_id: users[0].id, zoom: 17,
  center: {lat: 41.8887255, lng: -87.6270584}.to_json)

Tour.create(name: 'Crime and Mob Tour', creator_id: admin.id, zoom: 15,
  center: {lat: 41.92517580576991, lng: -87.6439905166626}.to_json) 

Tour.create(name: 'Film Tour', creator_id: users[2].id, zoom: 17,
  center: {lat: 41.8887255, lng: -87.6270584}.to_json)

Tour.create(name: 'City Tour', creator_id: users[3].id, zoom: 17,
  center: {lat: 41.8887255, lng: -87.6270584}.to_json)

Tour.create(name: 'Grand Tour', creator_id: admin.id, zoom: 17,
  center: {lat: 41.8887255, lng: -87.6270584}.to_json)


tour1 = admin.tours.first
tour2 = Tour.find_by(name: 'Crime and Mob Tour')

# create some POIs for our tours
Poi.create( name: 'Tribune Tower', tour_id: tour1.id,
          description: 'The Tribune Tower is a neo-Gothic building located at 435 North Michigan Avenue in Chicago, Illinois, USA. It is the home of the Chicago Tribune and Tribune Company.',
          image: 'assets/images/tribunetower2.jpg',
          location: {lat: 41.890401, lng: -87.623585}.to_json) 
Poi.create( name: 'Wrigley Building', tour_id: tour1.id,
          description: "The Wrigley Building is a skyscraper located directly across Michigan Avenue from the Tribune Tower on the Magnificent Mile. It was built to house the corporate headquarters of the Wrigley Company.",
          image: "assets/images/wrigley.jpg",
          location: {lat: 41.889435, lng: -87.624994}.to_json) 
Poi.create( name: 'Trump Tower', tour_id: tour1.id,
          description: "The Trump International Hotel and Tower, also known as Trump Tower Chicago and Trump Tower, is a skyscraper condo-hotel in downtown Chicago, Illinois. The building, named after billionaire real estate developer Donald Trump",
          image: "assets/images/trump.jpg",
          location: {lat: 41.888868, lng: -87.626394}.to_json) 
Poi.create( name: 'Marina City', tour_id: tour1.id,
          description: "Marina City is a mixed-use residential/commercial building complex that occupies an entire city block on State Street in Chicago, Illinois. The complex consists of two corncob-shaped, 587-foot (179 m), 65-story towers.",
          image: "assets/images/marina_city.jpg",
          location: {lat: 41.887986, lng: -87.628761}.to_json)  
Poi.create( name: 'House of Blues', tour_id: tour1.id,
          description: "Top rock, blues & more play at this music club, beloved for its Sunday gospel brunches.",
          image: "assets/images/houseofblues.jpg",
          location: {lat: 41.888233, lng: -87.62913}.to_json)

Poi.create( name: 'Green Mill Jazz Club', tour_id: tour2.id,
          description: "Once a favorite of Al Capone His favorite booth is still in the establishment located directly west of the short end of the bar. Capone and his men would sit here because it afforded clear views of both the front and back entrances to the establishment. It is rumored that there is still an access hatch to the tunnels located directly behind the long end of the bar that leads underneath the street to an adjacent building; this is how Capone was able to elude the authorities or the quasi detectives when he visited the Green Mill.",
          image: "assets/images/green_mill.jpg",
          location: {lat: 41.969199, lng: -87.65989}.to_json)
Poi.create( name: 'John Barleycorn', tour_id: tour2.id,
          description: "Once a speakeasy, it appeared to be a Chinese laundry, but in reality bar patrons entered through a back entrance through the basement, where the liquor was carted in. The pub still honors its roots by displaying a woodcarving dating back to the speakeasy days.",
          image: "assets/images/johnbarleycorn.jpg",
          location: {lat: 41.9238545, lng: -87.6461116}.to_json)
Poi.create( name: 'Victory Gardens Theatre', tour_id: tour2.id,
          description: "Way back in the day it was known as the Biograph Theater. Legendary bank robber John Dillinger met his demise there in 1934 while attending a movie.",
          image: "assets/images/victorygarden.jpg",
          location: {lat: 41.926343, lng: -87.649788}.to_json)
Poi.create( name: 'Victory Gardens Theatre', tour_id: tour2.id,
          description: "On February 14th, 1929, in an unheated brick garage at 2122 N. Clark St., seven men were lined up against a whitewashed wall and pumped with 90 bullets from submachine guns, shotguns and a revolver, eliminating the last challenge to Al Capone for the mantle of crime boss in Chicago.",
          image: "assets/images/victorygarden.jpg",
          location: {lat: 41.9207993, lng: -87.6375942}.to_json)




