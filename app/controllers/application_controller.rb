class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_counter
  
  def set_counter
    @count = DisablingLog.total_count
  end
end
