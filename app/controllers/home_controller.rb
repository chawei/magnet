class HomeController < ApplicationController
  before_filter :get_latest_log
  
  def index
    
  end
  
  def about
    
  end
  
  private
    def get_latest_log
      @latest_log = DisablingLog.last
    end
end