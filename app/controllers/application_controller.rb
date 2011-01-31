class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_counter
  
  helper_method :display_count
  
  def set_counter
    @count = DisablingLog.total_count
  end
  
  def display_count(count)
    final_count = ""
    count = count.to_s
    
    zero_len = 7 - count.length
    zero_len.times { final_count += "0" }
    final_count += count
    
    output_html = ""
    final_count.each_byte do |char|
      output_html += "<span class='digit'>#{char.chr}</span>"
    end
    
    return output_html.html_safe
  end
end
