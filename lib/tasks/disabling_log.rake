namespace :disabling_log do
  task :set_location => :environment do
    logs = DisablingLog.where("request_ip IS NOT NULL")
    logs.each do |log|
      log.set_city_and_country
      log.save
      print '.'
    end
  end
  
  task :to_lang_mapping => :environment do
    logs = DisablingLog.where("locale IS NOT NULL")
    logs.each do |log|
      lang = LangMapping.find_by_locale(log.locale)
      lang.disabling_logs << log
      print '.'
    end
  end
end