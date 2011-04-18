class Location < ActiveRecord::Base
  
  def self.find_coordinates_by_city_and_country(city_name, country_name)
    unless loc = find_by_city_and_country(city_name, country_name)
      res = Geokit::Geocoders::GoogleGeocoder.geocode("#{city_name}, #{country_name}")
      loc = create(:city => city_name, :country => country_name, :lng => res.lng.to_s, :lat => res.lat.to_s)
    end
    return loc
  end
end
