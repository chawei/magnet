class DisablingLog < ActiveRecord::Base
  include LangMappingsHelper
  
  belongs_to :lang_mapping
  
  before_create :set_city_and_country
  after_create :assign_to_lang_mapping
  
  def self.total_count
    DisablingLog.sum :button_count
  end
  
  def self.latest
    order('created_at DESC').first
  end
  
  def self.has_country
    where("country IS NOT NULL")
  end
  
  def location
    return nil if request_ip.blank?
    
    geo = GEOIP.city(request_ip)
    return "#{geo.city_name}, #{geo.country_code2}"
  end
  
  def set_city_and_country
    unless request_ip.blank?
      geo          = GEOIP.city(request_ip)
      self.city    = geo.city_name
      self.country = geo.country_code2
    end
  end
  
  def assign_to_lang_mapping
    lang = LangMapping.find_by_locale(self.locale)
    lang.disabling_logs << self
  end
  
  def exhibition
    output = {}
    points = []
      
    location = Location.find_coordinates_by_city_and_country(city, country)
    city_name = display_location(self)
    point = { 'properties' => { 
                  'html' => "<div class='marker_count'>#{button_count}</div><div class='marker_city'>#{city_name}</div>" 
                },
               "geometry" => {
                 "coordinates" => [location.lng.to_f, location.lat.to_f],
                 "type" => "Point"
               } 
              }
    points << point
    
    output = { 'like_text' => lang_mapping.like_text, 'btns_count' => button_count, 'points' => points }
    return output
  end
end
