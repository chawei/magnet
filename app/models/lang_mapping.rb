class LangMapping < ActiveRecord::Base
  has_many :disabling_logs
  
  def self.top_list
    select("lang_mappings.*, count(disabling_logs.id) as logs_count").joins(:disabling_logs).order("logs_count DESC").group('lang_mappings.locale')
  end
  
  def self.statistics
    select("lang_mappings.*, count(disabling_logs.id) as logs_count, sum(disabling_logs.button_count) as total_btns_count").joins(:disabling_logs).order("total_btns_count DESC").where("disabling_logs.city IS NOT NULL").group('lang_mappings.like_text')
  end
  
  def self.lang_name_by_locale(locale)
    find_by_locale(locale).try(:lang_name)
  end
  
  def top_cities
    disabling_logs.select("locale, city, country, sum(button_count) as city_count").where("city IS NOT NULL").group(:city).order("city_count DESC")
  end
  
  def top_10_cities
    top_cities.limit(10)
  end
  
  def top_langs
    disabling_logs.select("locale, sum(button_count) as locale_count").where("city IS NOT NULL").group(:locale).order("locale_count DESC")
  end
  
  def btns_count
    result = LangMapping.select("lang_mappings.*, sum(disabling_logs.button_count) as total_btns_count").joins(:disabling_logs).order("total_btns_count DESC").where(:like_text => self.like_text).where("disabling_logs.city IS NOT NULL").group(:like_text).first
    return result.total_btns_count.to_i
  end
end
