class HomeController < ApplicationController  
  def index
    @top_langs = LangMapping.top_list.limit(10)
  end
  
  def about 
  end  
end