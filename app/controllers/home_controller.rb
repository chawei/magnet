class HomeController < ApplicationController
  before_filter :get_latest_log
  
  def index
    @top_langs = LangMapping.top_list.limit(10)
  end
  
  def about 
  end
  
  private
    def get_latest_log
      @latest_log = DisablingLog.order('created_at DESC').first
    end
end