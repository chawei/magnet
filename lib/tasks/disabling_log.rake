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
  
  task :import_lang_mapping => :environment do
    lang_mapping = {}

    fileName = 'lib/extras/FacebookLocales.xml'

    doc = Nokogiri::XML(File.read(fileName))
    locales = doc.xpath('//locale')

    locales.each do |locale|
      rep, name, like_text = nil, nil, nil
      name = locale.css('englishName').text
      rep = locale.css('codes code representation').text
      link = "http://www.facebook.com/widgets/like.php?locale=#{rep}"
      doc = Nokogiri::HTML(open(link, "User-Agent" => "Ruby/#{RUBY_VERSION}"))
      like_text = doc.css("span.liketext").text

      LangMapping.create(:lang_name => name, :locale => rep, :like_text => like_text)
    end
  end
end