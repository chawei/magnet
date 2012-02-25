class Geo
  attr_accessor :city, :country
  
  def initialize(ip)
    begin
      geo      = GEOIP.city(ip)
      @city    = geo.city_name
      @country = geo.country_code2
    rescue
      @city    = nil
      @country = nil
    end
  end
end