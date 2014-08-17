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
tour3 = Tour.find_by(name: 'Film Tour')
tour4 = Tour.find_by(name: 'Sculpture Tour')

# create some POIs for our tours
Poi.create( name: 'Tribune Tower', tour_id: tour1.id,
          description: 'The Tribune Tower is a neo-Gothic building located at 435 North Michigan Avenue in Chicago, Illinois, USA. It is the home of the Chicago Tribune and Tribune Company.',
          image: '/assets/images/tribunetower2.jpg',
          location: {lat: 41.890401, lng: -87.623585}.to_json) 

Poi.create( name: 'Wrigley Building', tour_id: tour1.id,
          description: "The Wrigley Building is a skyscraper located directly across Michigan Avenue from the Tribune Tower on the Magnificent Mile. It was built to house the corporate headquarters of the Wrigley Company.",
          image: "/assets/images/wrigley.jpg",
          location: {lat: 41.889435, lng: -87.624994}.to_json) 

Poi.create( name: 'Trump Tower', tour_id: tour1.id,
          description: "The Trump International Hotel and Tower, also known as Trump Tower Chicago and Trump Tower, is a skyscraper condo-hotel in downtown Chicago, Illinois. The building, named after billionaire real estate developer Donald Trump",
          image: "/assets/images/trump.jpg",
          location: {lat: 41.888868, lng: -87.626394}.to_json) 

Poi.create( name: 'Marina City', tour_id: tour1.id,
          description: "Marina City is a mixed-use residential/commercial building complex that occupies an entire city block on State Street in Chicago, Illinois. The complex consists of two corncob-shaped, 587-foot (179 m), 65-story towers.",
          image: "/assets/images/marina_city.jpg",
          location: {lat: 41.887986, lng: -87.628761}.to_json)  

Poi.create( name: 'House of Blues', tour_id: tour1.id,
          description: "Top rock, blues & more play at this music club, beloved for its Sunday gospel brunches.",
          image: "/assets/images/houseofblues.jpg",
          location: {lat: 41.890401, lng: -87.623585}.to_json)

Poi.create( name: 'Wrigley Building', tour_id: tour1.id,
          description: "The Wrigley Building is a skyscraper located directly across Michigan Avenue from the Tribune Tower on the Magnificent Mile. It was built to house the corporate headquarters of the Wrigley Company.",
          image: "/assets/wrigley.jpg",
          location: {lat: 41.889435, lng: -87.624994}.to_json)
Poi.create( name: 'Trump Tower', tour_id: tour1.id,
          description: "The Trump International Hotel and Tower, also known as Trump Tower Chicago and Trump Tower, is a skyscraper condo-hotel in downtown Chicago, Illinois. The building, named after billionaire real estate developer Donald Trump",
          image: "/assets/trump_tower.jpg",
          location: {lat: 41.888868, lng: -87.626394}.to_json)
Poi.create( name: 'Marina City', tour_id: tour1.id,
          description: "Marina City is a mixed-use residential/commercial building complex that occupies an entire city block on State Street in Chicago, Illinois. The complex consists of two corncob-shaped, 587-foot (179 m), 65-story towers.",
          image: "/assets/marina_city.jpg",
          location: {lat: 41.887986, lng: -87.628761}.to_json)
Poi.create( name: 'House of Blues', tour_id: tour1.id,
          description: "Top rock, blues & more play at this music club, beloved for its Sunday gospel brunches.",
          image: "/assets/houseofblues.jpg",
          location: {lat: 41.888233, lng: -87.62913}.to_json)

Poi.create( name: 'Green Mill Jazz Club', tour_id: tour2.id,
          description: "Once a favorite of Al Capone His favorite booth is still in the establishment located directly west of the short end of the bar. Capone and his men would sit here because it afforded clear views of both the front and back entrances to the establishment. It is rumored that there is still an access hatch to the tunnels located directly behind the long end of the bar that leads underneath the street to an adjacent building; this is how Capone was able to elude the authorities or the quasi detectives when he visited the Green Mill.",
          image: "/assets/images/green_mill.jpg",
          location: {lat: 41.969199, lng: -87.65989}.to_json)
Poi.create( name: 'John Barleycorn', tour_id: tour2.id,
          description: "Once a speakeasy, it appeared to be a Chinese laundry, but in reality bar patrons entered through a back entrance through the basement, where the liquor was carted in. The pub still honors its roots by displaying a woodcarving dating back to the speakeasy days.",
          image: "/assets/images/johnbarleycorn.jpg",
          location: {lat: 41.9238545, lng: -87.6461116}.to_json)
Poi.create( name: 'Victory Gardens Theatre', tour_id: tour2.id,
          description: "Way back in the day it was known as the Biograph Theater. Legendary bank robber John Dillinger met his demise there in 1934 while attending a movie.",
          image: "/assets/images/victorygarden.jpg",
          location: {lat: 41.926343, lng: -87.649788}.to_json)
Poi.create( name: 'Victory Gardens Theatre', tour_id: tour2.id,
          description: "On February 14th, 1929, in an unheated brick garage at 2122 N. Clark St., seven men were lined up against a whitewashed wall and pumped with 90 bullets from submachine guns, shotguns and a revolver, eliminating the last challenge to Al Capone for the mantle of crime boss in Chicago.",
          image: "/assets/images/victorygarden.jpg",
          location: {lat: 41.969199, lng: -87.65989}.to_json)
Poi.create( name: 'John Barleycorn', tour_id: tour2.id,
          description: "Once a speakeasy, it appeared to be a Chinese laundry, but in reality bar patrons entered through a back entrance through the basement, where the liquor was carted in. The pub still honors its roots by displaying a woodcarving dating back to the speakeasy days.",
          image: "/assets/johnbarleycorn.jpg",
          location: {lat: 41.9238545, lng: -87.6461116}.to_json)
Poi.create( name: 'Victory Gardens Theatre', tour_id: tour2.id,
          description: "Way back in the day it was known as the Biograph Theater. Legendary bank robber John Dillinger met his demise there in 1934 while attending a movie.",
          image: "/assets/victorygarden.jpg",
          location: {lat: 41.926343, lng: -87.649788}.to_json)
Poi.create( name: 'Victory Gardens Theatre', tour_id: tour2.id,
          description: "On February 14th, 1929, in an unheated brick garage at 2122 N. Clark St., seven men were lined up against a whitewashed wall and pumped with 90 bullets from submachine guns, shotguns and a revolver, eliminating the last challenge to Al Capone for the mantle of crime boss in Chicago.",
          image: "/assets/victorygarden.jpg",
          location: {lat: 41.9207993, lng: -87.6375942}.to_json)

Poi.create( name: 'Union Station', tour_id: tour3.id,
          description: "Union Station is a major railroad station that opened in 1925 in Chicago, replacing an earlier station built in 1881. It is the third-busiest rail terminal in the United States and is now the only intercity rail terminal in Chicago. It handles approximately 120,000 passengers on an average weekday and is one of Chicago’s most iconic structures, reflecting the city’s strong architectural heritage and historical achievements. Its facilities are mostly underground, buried beneath streets and skyscrapers.",
          image: "/assets/images/unionStation.jpg",
          location: {lat: 41.878607, lng: -87.639408}.to_json)

Poi.create( name: 'Marina City', tour_id: tour3.id,
          description: "The Marina City complex was designed in 1959 by architect Bertrand Goldberg and completed in 1964 at a cost of $36 million. Local television station WFLD, (FOX Channel 32) had its studios and transmitter at Marina City for eighteen years until they were bought by Metromedia. WLS-TV (ABC Channel 7) kept its transmitter atop Marina City until the Willis Tower (formerly known as Sears Tower) was completed.",
          image: "/assets/images/marina_city.jpg",
          location: {lat: 41.888064, lng: -87.628422}.to_json)

Poi.create( name: 'Pump Room', tour_id: tour3.id,
          description: "The Pump Room, established October 1, 1938, by Ernie Byfield, is a restaurant located in the Public Chicago Hotel, formerly The Ambassador East, in Chicago's Gold Coast area. The restaurant served a number of celebrities who were regular customers and has been written about in books and articles.",
          image: "/assets/images/pumproom.jpg",
          location: {lat: 41.887937, lng: -87.629109}.to_json)

Poi.create( name: 'Cloud Gate', tour_id: tour3.id,
          description: "Cloud Gate is a public sculpture by Indian-born British artist Anish Kapoor, that is the centerpiece of AT&T Plaza at Millennium Park. Constructed between 2004 and 2006, the sculpture is nicknamed The Bean. The design was inspired by liquid mercury and the sculpture's surface reflects and distorts the city's skyline. Visitors are able to walk around and under Cloud Gate's 12-foot high arch.",
          image: "/assets/images/bean.jpg",
          location: {lat: 41.882925, lng: -87.623315}.to_json)

Poi.create( name: 'Monument with Standing Beast', tour_id: tour4.id,
          description: "Monument with Standing Beast is a sculpture by Jean Dubuffet in front of James R. Thompson Center in the Loop community area of Chicago. It is based on Dubuffet's 1960 painting series Hourioupe. The sculpture and the series of figural and landscape designs it is a part of reflects his thoughts of earliest monumental commission.",
          image: "/assets/images/standingbeast.jpg",
          location: {lat: 41.885063, lng: -87.631646}.to_json)

Poi.create( name: 'The "Picasso', tour_id: tour4.id,
          description: "The Picasso is an untitled monumental sculpture by Pablo Picasso in Chicago, Illinois. The sculpture, dedicated on August 15, 1967, in Daley Plaza in the Chicago Loop, is 50 feet tall.",
          image: "/assets/images/picasso.jpg",
          location: {lat: 41.883946, lng: -87.630197}.to_json)

Poi.create( name: 'Dawn Shadows', tour_id: tour4.id,
          description: "Located in Madison Plaza. Dawn Shadows is one of Louise Nevelson's signature large, monochromatic sculptures. Rendered in painted steel, this structure is inspired by Chicago's elevated train system, which passes by just a few feet away.",
          image: "/assets/images/dawnshadows.jpg",
          location: {lat: 41.882253, lng: -87.634320}.to_json)

Poi.create( name: 'Flamingo', tour_id: tour4.id,
          description: "Flamingo, created by noted American artist Alexander Calder, is a 53-foot tall stabile located in the Federal Plaza in front of the Kluczynski Federal Building. Flamingo weighs 50 tons, is composed of steel, and is vermilion in color. Calder gave the stabile its color, which has come to be called 'Calder red', to offset it from the black and steel surroundings of nearby office buildings. The stabile is an art form which Calder pioneered.",
          image: "/assets/images/flamingo.jpg",
          location: {lat: 41.878790, lng: -87.629677}.to_json)

Poi.create( name: 'Cloud Gate', tour_id: tour3.id,
          description: "Cloud Gate is a public sculpture by Indian-born British artist Anish Kapoor, that is the centerpiece of AT&T Plaza at Millennium Park. Constructed between 2004 and 2006, the sculpture is nicknamed The Bean. The design was inspired by liquid mercury and the sculpture's surface reflects and distorts the city's skyline. Visitors are able to walk around and under Cloud Gate's 12-foot high arch.",
          image: "/assets/images/bean.jpg",
          location: {lat: 41.882925, lng: -87.623315}.to_json)

Poi.create( name: 'Bronze Lion', tour_id: tour4.id,
          description: "Edward Kemeys was an American sculptor. He is best known for his sculptures of animals, particularly the two bronze lions that mark the entrance to the Art Institute of Chicago.",
          image: "/assets/images/lion.jpg",
          location: {lat: 41.879572, lng: -87.623705}.to_json)











