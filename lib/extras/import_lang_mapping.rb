require 'json'
require 'open-uri'
require 'Nokogiri'

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
  #lang_mapping[rep] = { 'like_text' => like_text, 'lang_text' => name }
end

#file = File.new('lang_temp.js', 'w')
#file.write(lang_mapping.to_json)
#file.close