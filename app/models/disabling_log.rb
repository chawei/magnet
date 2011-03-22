class DisablingLog < ActiveRecord::Base
  
  def self.total_count
    DisablingLog.sum :button_count
  end
  
  def location
    return nil if request_ip.blank?
    
    geo = Autometal::Geoip.new(request_ip)
    return "#{geo.city}, #{geo.country}"
  end
end
