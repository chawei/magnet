class AddRequestIpToDisablingLogs < ActiveRecord::Migration
  def self.up
    add_column :disabling_logs, :request_ip, :string
  end

  def self.down
    remove_column :disabling_logs, :request_ip
  end
end
