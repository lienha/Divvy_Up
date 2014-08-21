json.(@tour, :name, :zoom, :lat, :lng, :short_description, :long_description)

json.pois(@tour.pois, :id, :name, :description, :lat, :lng, :image)