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
Recommendation.delete_all

users = []

10.times do |i|
  users[i] = User.create( username: Faker::Internet.user_name, email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
end

admin = User.create( username: 'admin', email: 'admin@gmail.com', password: 'password', password_confirmation: 'password')


Tour.create(name: 'Architecture Tour', creator_id: admin.id, zoom: 17,
             lat: 41.8887255, lng: -87.6270584,
            short_description: "Get great views of Chicago architecture and outdoor art installations in this tour.",
            long_description: "Chicago is world-famous for its incredible, recognizable skyline. Get great views of Chicago architecture with Tribune Tower which won the most beautiful and distinctive office building in the world in 1922, Wrigley Building is one of the original business addresses, the luxurious Trump Tower, and Marina City with two 60-story towers which was the biggest ever built in concrete and its shape was in contrast with the contemporary architectural concepts of straight lines and cubical apartment buildings. ")

Tour.create(name: 'Sculpture Tour', creator_id: admin.id, zoom: 15,
             lat: 41.8887255, lng: -87.6270584,
            short_description: "Visit the endless collections at the Art Institute and many public art sculptures by the world's most famous modern artists like Picasso and Calder.",
            long_description: "From Jean Dubuffet's Monument With Standing Beast to Anish Kapoor's Cloud Gate, this  tour winds through down town Chicago, passing some of the city's landmark buildings and stopping at monumental sculptures commissioned from some of the most important artists of their time. There are endless collections at the Art Institute and many overlook the world-class collection of public art on display throughout Chicago's commercial center. The Loop is a veritable open air museum of sculptures by the world's most famous modern artists (Picasso, Calder, Miro, Lewitt, etc.), and it's all, of course, free. These monumental sculptures are a both part of Chicago's distinctive character and a major source of civic pride. Take this tour in the morning or early afternoon, and stop at one of the many coffee houses or cafes along the way for a morning pick-me-up or mid-day meal.")

Tour.create(name: 'Gangster Tour', creator_id: admin.id, zoom: 15,
             lat: 41.92517580576991, lng: -87.6439905166626,
            short_description: "Explore the city’s most famous crime scenes.",
            long_description: "Chicago is full of crime scenes and historical landmarks made famous by our city’s own mobs and gangsters. In this tour, explore the city’s most famous crime scenes as you investigate stories about Al Capone, The Untouchables, the Chicago Mob and their and mischievous activities.")

Tour.create(name: 'Film Tour', creator_id: admin.id, zoom: 14,
             lat: 41.8887255, lng: -87.6270584,
            short_description: "Explore city's famous movie scenes and celebrity hangouts.",
            long_description: "Explore city's famous movie scenes and celebrity frequencings. Start your tour at Union Station, then to The Marina City which was a Local television station WFLD, (FOX Channel 32) had its studios and transmitter for eighteen years until they were bought by Metromedia. WLS-TV (ABC Channel 7) kept its transmitter atop Marina City until the Willis Tower (formerly known as Sears Tower) was completed. Or the Pump Room, a restaurant located in the Public Chicago Hotel in Chicago's Gold Coast area. The restaurant served a number of celebrities who were regular customers and has been written about in books and articles.")

# because these tours do not have POI, they crash the app.
# Tour.create(name: 'City Tour', creator_id: admin.id, zoom: 17,
#    lat: 41.8887255, lng: -87.6270584)

# Tour.create(name: 'Grand Tour', creator_id: admin.id, zoom: 17,
#    lat: 41.8887255, lng: -87.6270584)


tour1 = admin.tours.first
tour2 = Tour.find_by(name: 'Gangster Tour')
tour3 = Tour.find_by(name: 'Film Tour')
tour4 = Tour.find_by(name: 'Sculpture Tour')

# create some POIs for our tours
Poi.create( name: 'Tribune Tower', tour_id: tour1.id,
            description: 'The Tribune Tower is a neo-Gothic building located at 435 North Michigan Avenue in Chicago, Illinois, USA. It is the home of the Chicago Tribune and Tribune Company.',
            image: '/assets/tribunetower2.jpg',
            lat: 41.890401, lng: -87.623585)

Poi.create( name: 'Wrigley Building', tour_id: tour1.id,
            description: "The Wrigley Building is a skyscraper located directly across Michigan Avenue from the Tribune Tower on the Magnificent Mile. It was built to house the corporate headquarters of the Wrigley Company.",
            image: "/assets/wrigley.jpg",
            lat: 41.889435, lng: -87.624994)

Poi.create( name: 'Trump Tower', tour_id: tour1.id,
          description: "The Trump International Hotel and Tower, also known as Trump Tower Chicago and Trump Tower, is a skyscraper condo-hotel in downtown Chicago, Illinois. The building, named after billionaire real estate developer Donald Trump",
          image: "/assets/trump_tower.jpg",
          lat: 41.888868, lng: -87.626394)


Poi.create( name: 'Marina City', tour_id: tour1.id,
            description: "Marina City is a mixed-use residential/commercial building complex that occupies an entire city block on State Street in Chicago, Illinois. The complex consists of two corncob-shaped, 587-foot (179 m), 65-story towers.",
            image: "/assets/marina_city.jpg",
            lat: 41.887986, lng: -87.628761)

Poi.create( name: 'House of Blues', tour_id: tour1.id,
            description: "Top rock, blues & more play at this music club, beloved for its Sunday gospel brunches.",
            image: "/assets/houseofblues.jpg",
            lat: 41.888233, lng: -87.62913)

# Poi.create( name: 'Green Mill Jazz Club', tour_id: tour2.id,
#             description: "Once a favorite of Al Capone His favorite booth is still in the establishment located directly west of the short end of the bar. Capone and his men would sit here because it afforded clear views of both the front and back entrances to the establishment. It is rumored that there is still an access hatch to the tunnels located directly behind the long end of the bar that leads underneath the street to an adjacent building; this is how Capone was able to elude the authorities or the quasi detectives when he visited the Green Mill.",
#             image: "/assets/green_mill.jpg",
#             lat: 41.969199, lng: -87.65989)
Poi.create( name: 'S-M-G Garage', tour_id: tour2.id,
            description: "Site of the St Valentine's Day Massacre, Chicago, Illinois. It happened on February 14, 1929, when seven members of the Bugs Moran gang were gunned down by members of the Al Capone gang. The victims were stood against a brick wall and shot.",
            image: "/assets/st_valentines.jpg",
            lat: 41.9207993, lng: -87.6375942)            
Poi.create( name: 'John Barleycorn', tour_id: tour2.id,
            description: "Once a speakeasy, it appeared to be a Chinese laundry, but in reality bar patrons entered through a back entrance through the basement, where the liquor was carted in. The pub still honors its roots by displaying a woodcarving dating back to the speakeasy days.",
            image: "/assets/johnbarleycorn.jpg",
            lat: 41.9238545, lng: -87.6461116)
Poi.create( name: 'Victory Gardens Theatre', tour_id: tour2.id,
            description: "Way back in the day it was known as the Biograph Theater. Legendary bank robber John Dillinger met his demise there in 1934 while attending a movie.",
            image: "/assets/victorygarden.jpg",
            lat: 41.926343, lng: -87.649788)

Poi.create( name: 'Union Station', tour_id: tour3.id,
            description: "Union Station is a major railroad station that opened in 1925 in Chicago, replacing an earlier station built in 1881. It is the third-busiest rail terminal in the United States and is now the only intercity rail terminal in Chicago. It handles approximately 120,000 passengers on an average weekday and is one of Chicago’s most iconic structures, reflecting the city’s strong architectural heritage and historical achievements. Its facilities are mostly underground, buried beneath streets and skyscrapers.",
            image: "/assets/unionStation.jpg",
            lat: 41.878607, lng: -87.639408)

Poi.create( name: 'Marina City', tour_id: tour3.id,
            description: "The Marina City complex was designed in 1959 by architect Bertrand Goldberg and completed in 1964 at a cost of $36 million. Local television station WFLD, (FOX Channel 32) had its studios and transmitter at Marina City for eighteen years until they were bought by Metromedia. WLS-TV (ABC Channel 7) kept its transmitter atop Marina City until the Willis Tower (formerly known as Sears Tower) was completed.",
            image: "/assets/marina_city.jpg",
            lat: 41.888064, lng: -87.628422)

Poi.create( name: 'Pump Room', tour_id: tour3.id,
            description: "The Pump Room, established October 1, 1938, by Ernie Byfield, is a restaurant located in the Public Chicago Hotel, formerly The Ambassador East, in Chicago's Gold Coast area. The restaurant served a number of celebrities who were regular customers and has been written about in books and articles.",
            image: "/assets/pumproom.jpg",
            lat: 41.887937, lng: -87.629109)

Poi.create( name: 'Cloud Gate', tour_id: tour3.id,
            description: "Cloud Gate is a public sculpture by Indian-born British artist Anish Kapoor, that is the centerpiece of AT&T Plaza at Millennium Park. Constructed between 2004 and 2006, the sculpture is nicknamed The Bean. The design was inspired by liquid mercury and the sculpture's surface reflects and distorts the city's skyline. Visitors are able to walk around and under Cloud Gate's 12-foot high arch.",
            image: "/assets/bean.jpg",
            lat: 41.882925, lng: -87.623315)


Poi.create( name: 'Monument with Standing Beast', tour_id: tour4.id,
            description: "Monument with Standing Beast is a sculpture by Jean Dubuffet in front of James R. Thompson Center in the Loop community area of Chicago. It is based on Dubuffet's 1960 painting series Hourioupe. The sculpture and the series of figural and landscape designs it is a part of reflects his thoughts of earliest monumental commission.",
            image: "/assets/standingbeast.jpg",
            lat: 41.885063, lng: -87.631646)

Poi.create( name: 'The Picasso', tour_id: tour4.id,
            description: "The Picasso is an untitled monumental sculpture by Pablo Picasso in Chicago, Illinois. The sculpture, dedicated on August 15, 1967, in Daley Plaza in the Chicago Loop, is 50 feet tall.",
            image: "/assets/picasso.jpg",
            lat: 41.883946, lng: -87.630197)

Poi.create( name: 'Dawn Shadows', tour_id: tour4.id,
            description: "Located in Madison Plaza. Dawn Shadows is one of Louise Nevelson's signature large, monochromatic sculptures. Rendered in painted steel, this structure is inspired by Chicago's elevated train system, which passes by just a few feet away.",
            image: "/assets/dawnshadows.jpg",
            lat: 41.882253, lng: -87.634320)

Poi.create( name: 'Flamingo', tour_id: tour4.id,
            description: "Flamingo, created by noted American artist Alexander Calder, is a 53-foot tall stabile located in the Federal Plaza in front of the Kluczynski Federal Building. Flamingo weighs 50 tons, is composed of steel, and is vermilion in color. Calder gave the stabile its color, which has come to be called 'Calder red', to offset it from the black and steel surroundings of nearby office buildings. The stabile is an art form which Calder pioneered.",
            image: "/assets/flamingo.jpg",
            lat: 41.878790, lng: -87.629677)

Poi.create( name: 'Cloud Gate', tour_id: tour3.id,
            description: "Cloud Gate is a public sculpture by Indian-born British artist Anish Kapoor, that is the centerpiece of AT&T Plaza at Millennium Park. Constructed between 2004 and 2006, the sculpture is nicknamed The Bean. The design was inspired by liquid mercury and the sculpture's surface reflects and distorts the city's skyline. Visitors are able to walk around and under Cloud Gate's 12-foot high arch.",
            image: "/assets/bean.jpg",
            lat: 41.882925, lng: -87.623315)

Poi.create( name: 'Bronze Lion', tour_id: tour4.id,
            description: "Edward Kemeys was an American sculptor. He is best known for his sculptures of animals, particularly the two bronze lions that mark the entrance to the Art Institute of Chicago.",
            image: "/assets/lion.jpg",
            lat: 41.879572, lng: -87.623705)

Comment.create(poi_id: 1, user_id: users.sample.id,
               text: "Superb building with a real history. Just walk around the entire outside and see all the other incredible stones / pieces from other buildings. I love how Chicago has kept its history and its architecture intact for all to see and this building has to be one of the best. Great city.")

Comment.create(poi_id: 1, user_id: users.sample.id,
               text: "Loved this quirky building. The pieces of other buildings stuck around the outside from around the world are really fun. The neo Gothic architecture in skyscraper form is so odd and really great. It was my favorite and there are so many terrific buildings in Chicago!")

Comment.create(poi_id: 1, user_id: users.sample.id,
               text: "This is my favorite building in Chicago.  It's classic!  The land was selected by chewing gum magnate William Wrigley Jr. to headquarter his gum company.  On the south tower of the building, is the infamous clock which points in all directions!  How great is that?  It doesn't matter where in the city you are, if you are close enough to Wrigley,  you can see the clock! The architecture of this building is iconic and you can't leave Chicago without a picture of the Wrigley Building overlooking the Chicago River with the flags waving in the wind on the Michigan Avenue Bridge.")

Comment.create(poi_id: 2, user_id: users.sample.id,
               text: "I'm always magnified by this building whenever I am in the City.  It has been around for some time now.  Each year there is some effort and work put into it to make the building even better.  The building is open to all tourists to take a look around.")

Comment.create(poi_id: 2, user_id: users.sample.id,
               text: "This place has a beautiful atmosphere, especially sitting outdoors.I didn't like the fact that we bought a drink in the indoor bar while we were waiting for our outdoor table and we were not allowed to take it with us once our outdoor table was ready.")

Comment.create(poi_id: 2, user_id: users.sample.id,
               text: "This hotel is exceptional. Room service is pricey, but it is the best food. We got room service every morning  (4 mornings) and their wasn't a bad experience.")

Comment.create(poi_id: 2, user_id: users.sample.id,
               text: "This place has a beautiful atmosphere, especially sitting outdoors.I didn't like the fact that we bought a drink in the indoor bar while we were waiting for our outdoor table and we were not allowed to take it with us once our outdoor table was ready.")

Comment.create(poi_id: 3, user_id: users.sample.id,
               text: "his building does look cooler than it lives.  Mainly, the ceilings are too low for current standards.  But on the plus side, the balconies are way larger than current standards.  If you are committed to modernism, you can almost certainly get around the ceiling height.")

Comment.create(poi_id: 3, user_id: users.sample.id,
               text: "This is one of the coolest buildings in Chicago. Even if you're not a Wilco fan, you'll probably be able to pick out this piece of architecture from afar. I can see why Wilco chose this building for their cover of Yankee Hotel Foxtrot.")

Comment.create(poi_id: 3, user_id: users.sample.id,
               text: "Maybe it is the old Wilco fan in me, but this is my very favorite piece of Chicago architecture. When in town, I always stay in a nearby hotel, just so I get a bunch of glimpses.")

Comment.create(poi_id: 4, user_id: users.sample.id,
               text: "The House of Blues is the best music venue I have been to in Chicago. When it comes to seeing live music I wouldn't wanna do it anywhere else.")

Comment.create(poi_id: 4, user_id: users.sample.id,
               text: "This place has the kind of character that can really enhance any musical experience you have. There's a true Chicago feel to the architecture, and when you fill it with a crowd, and some great music, the entire place comes to life.")

Comment.create(poi_id: 5, user_id: users.sample.id,
               text: "We spent a great Thursday night at the Green Mill. It's a bit of a hike on the Red Line from the loop where we stayed, but worth the trip. There was a 16 piece big band, the Alan Gresik Swing Shift Orchestra, who play very Thursday. The cover's only $6, the crowd diverse, and the vibe is very fun.")

Comment.create(poi_id: 5, user_id: users.sample.id,
               text: "Good music. Great setting. Not much else to it. Came here on a busy Friday for the 9pm set. The bar selection is average. The staff is decent, but not trying to impress. But none of that matters. The music is just right, and the room is dripping in history. Its worth the visit.")

Comment.create(poi_id: 6, user_id: users.sample.id,
               text: "So this strip gets bad reviews for the nightlife, but the locals really need to check it out for daytime food enjoyment. The groupon has helped this and I am grateful. My apple pancake was delicious- a large plate of griddle-cooked goodness. The bloody marys are great too- spicy and with a weird and fun curly noodle of cheese. The decor is amazing and there are plenty of TVs to watch your weekend sports. Service is attentive and friendly and the prices are reasonable for the amount of food you're getting. River Northians, you really need to give this place a try for brunch!")

Comment.create(poi_id: 6, user_id: users.sample.id,
               text: "Went here right before a cubs night game. Got here at about 5 o'clock, two hours before game time. Hostess seated us right away at a really nice table right near the window. Server came over right away and took our drink and food order. Drinks and food are a little pricey, but the food was excellent and the beer was cold! They only get 4 out of 5 stars from me just because of their pricing - it was almost 40 dollars for my friend and I, and we each had a burger. I had 2 beers and he had 1.")

Comment.create(poi_id: 7, user_id: users.sample.id,
               text: "Stopped for last minute tickets after dinner with friends. Saw a show in the upstairs theater. It's a great small theater...seats nicely spaced, easy to see and hear the shows from any spot in the place. Staff was extremely nice. Great experience!")

Comment.create(poi_id: 7, user_id: users.sample.id,
               text: "Yes, this is where that gangster was shot! And not only that, it has been converted into a state of the art theatre for the Tony award winning Victory Gardens Theatre.")

Comment.create(poi_id: 8, user_id: users.sample.id,
               text: "Main entrance is a bit hard to spot because the building looks deserted from outside.  I just followed the lady and found myself looking up at the high ceiling and feeling a bit of nostalgia. This place reminded me of Grand Central minus the endless human traffic. ")

Comment.create(poi_id: 8, user_id: users.sample.id,
               text: "Located in the heart of the city, this bustling, hustling slice of Americana has to be visited whether you're in transit or not. The sights and sounds emanating from this historic grand ol' station harkens back to a simpler time, a simpler place. Plenty of good food available inside the terminal including the all-important Chicago Hot Dog. I could watch those powerful trains come and go all day @Amtrak.")

Comment.create(poi_id: 9, user_id: users.sample.id,
               text: "Definitely agree that Marina Towers are architectural landmarks in our city and the view from the top is spectacular.")

Comment.create(poi_id: 9, user_id: users.sample.id,
               text: "The two towers are both architectual landmarks in our fine town. Some of the apts./condos are huge and of course very expensive. I think there was more fuss made about these buildings in the 60's, but I think they should be seen and visited to be appreciated.")

Comment.create(poi_id: 10, user_id: users.sample.id,
               text: "When going to Chicago I researched some good restaurants to visit and this came up in the top 40 restaurants in Chicago.  It was also known to have served many stars.. especially from back in the day.  Cool!  So, I booked a reservation for one and went all by myself. I was in Chicago by myself to do a half marathon.")

Comment.create(poi_id: 10, user_id: users.sample.id,
               text: "Go for the fried chicken and ginger margaritas. I've only ever ordered these two things and been so happy with my meal, but dining with others who've ordered anything else have felt a bit meh about their food and drinks.")

Comment.create(poi_id: 11, user_id: users.sample.id,
               text: "It's a busy place which is good & bad. The good thing is that there is someone to ask to take a picture of you and/or your group in front of it since a selfie doesn't do it justice. The view with the skyline in the back is awesome but you will get tons of people in your picture.")

Comment.create(poi_id: 11, user_id: users.sample.id,
               text: "This is the silliest thing - but you can't NOT stop and check out yourself and the reflections of others as you are passing by. My favorite thing is the way it reflects the skyline in the background.")

Comment.create(poi_id: 12, user_id: users.sample.id,
               text: "A lot of people did not like Dubuffet's sculpture when it was unveiled in Chicago but I find it joyful and fun, and much better a contribution to Chicago than the accompanying Thompson Center. PS: It may have the word 'monument' in its name, but its actually a sculpture and not really a monument to anything.")

Comment.create(poi_id: 12, user_id: users.sample.id,
               text: "The only reason that this is needed outside the James Thompson Building is to make the James Thompson Building look architecturally staid - which it isn't.  A playful cartoon blob on the street.  You can play in it if you like running through calcified intestines.")

Comment.create(poi_id: 13, user_id: users.sample.id,
               text: "The first time I saw this was a long time ago. I had been in near north Chicago and happened upon it in the light of a full moon. I took a lot of pictures of it, and I still do whenever I see it. I think it's one of the greatest pieces of art in the world, a magnificent piece of work that has so many different things going on as long as you look hard enough. Look for the madonna and child among those images.")

Comment.create(poi_id: 13, user_id: users.sample.id,
               text: "This sculpture is magnificent and it is front and center in one of the most beautiful plazas of chicago. Don't miss out on the Miro, much smaller scale, in one side of the square. The city hall building is right there as well you can't miss it.")

Comment.create(poi_id: 14, user_id: users.sample.id,
               text: "The Flamingo is a 53-foot tall red steel sculpture in the Kluczynski Federal Building plaza. This sculpture titled Flamingo is made by Alexander Calder, one of the most eminent sculptors of the 20th century American art. The Flamingo weighs 50 tons and is composed of steel.")

Comment.create(poi_id: 14, user_id: users.sample.id,
               text: "We found it by accident walking through the city but I loved it. My friend did not, she doesn't like modern art, but I thought it was interesting. Something fun right in the middle of the city.")

Recommendation.create(tour_id: tour1.id, user_id: users.sample.id,
     text: "Please consider adding the Willis Tower. I love that place.")


