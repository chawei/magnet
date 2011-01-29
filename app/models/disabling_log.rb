class DisablingLog < ActiveRecord::Base
  
  def self.total_count
    DisablingLog.sum :button_count
  end
end
