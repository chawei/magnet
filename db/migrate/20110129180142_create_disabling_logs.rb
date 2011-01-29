class CreateDisablingLogs < ActiveRecord::Migration
  def self.up
    create_table :disabling_logs do |t|
      t.string :title
      t.string :url
      t.integer :button_count
      t.string :button_type

      t.timestamps
    end
  end

  def self.down
    drop_table :disabling_logs
  end
end
