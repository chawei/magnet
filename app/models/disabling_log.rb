class DisablingLog < ActiveRecord::Base
  belongs_to :lang_mapping
  
  before_create :set_city_and_country
  
  def self.total_count
    DisablingLog.sum :button_count
  end
  
  def location
    return nil if request_ip.blank?
    
    geo = Autometal::Geoip.new(request_ip)
    return "#{geo.city}, #{geo.country}"
  end
  
  def set_city_and_country
    unless request_ip.blank?
      geo = Autometal::Geoip.new(request_ip)
      self.city = geo.city
      self.country = geo.country
    end
  end
end
