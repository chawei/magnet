class AddLangMappingIdToDisablingLogs < ActiveRecord::Migration
  def self.up
    add_column :disabling_logs, :lang_mapping_id, :integer
  end

  def self.down
    remove_column :disabling_logs, :lang_mapping_id
  end
end
