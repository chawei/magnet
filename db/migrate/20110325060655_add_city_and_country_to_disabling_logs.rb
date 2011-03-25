class AddCityAndCountryToDisablingLogs < ActiveRecord::Migration
  def self.up
    add_column :disabling_logs, :city, :string
    add_column :disabling_logs, :country, :string
  end

  def self.down
    remove_column :disabling_logs, :country
    remove_column :disabling_logs, :city
  end
end
