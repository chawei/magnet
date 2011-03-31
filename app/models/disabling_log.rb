class DisablingLog < ActiveRecord::Base
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
  
  def assign_to_lang_mapping
    lang = LangMapping.find_by_locale(self.locale)
    lang.disabling_logs << self
  end
end
