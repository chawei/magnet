class LangMapping < ActiveRecord::Base
  has_many :disabling_logs
  
  def self.top_list
    select("lang_mappings.*, count(disabling_logs.id) as logs_count").joins(:disabling_logs).order("logs_count DESC").group('lang_mappings.locale')
  end
  
  def self.statistics
    select("lang_mappings.*, count(disabling_logs.id) as logs_count, sum(disabling_logs.button_count) as total_btns_count").joins(:disabling_logs).order("total_btns_count DESC").group('lang_mappings.like_text')
  end
  
  def top_cities
    disabling_logs.select("locale, city, country, count(id) as count").group(:city).order("count DESC")
  end
end
