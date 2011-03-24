class ApplicationController < ActionController::Base
  include ActionView::Helpers::DateHelper
  
  protect_from_forgery
  
  before_filter :set_counter
  
  helper_method :display_count, :display_update
  
  def set_counter
    @count = DisablingLog.total_count
  end
  
  def display_count(count)
    final_count = ""
    count = count.to_s
    
    zero_len = 8 - count.length
    zero_len.times { final_count += "0" }
    final_count += count
    
    output_html = ""
    final_count.each_byte do |char|
      output_html += "<span class='digit'>#{char.chr}</span>"
    end
    if log = DisablingLog.last
      last_update_in_words = time_ago_in_words(log.created_at)
      #log.created_at.strftime("%R %D")
      last_update = log.created_at.iso8601
      output_html += "<span class='last_update'>Last Update: <abbr class='time_ago' title='#{last_update}'>#{last_update_in_words} ago</abbr></span>"
    end
    return output_html.html_safe
  end
  
  def display_update()
    return 'tasjdkljalksj'
  end
  
end
