class HomeController < ApplicationController
  def index
    @count = DisablingLog.total_count
  end
end