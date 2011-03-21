class AddLocaleToDisablingLogs < ActiveRecord::Migration
  def self.up
    add_column :disabling_logs, :locale, :string
  end

  def self.down
    remove_column :disabling_logs, :locale
  end
end
