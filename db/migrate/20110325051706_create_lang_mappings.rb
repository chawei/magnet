class CreateLangMappings < ActiveRecord::Migration
  def self.up
    create_table :lang_mappings do |t|
      t.string :lang_name
      t.string :locale
      t.string :like_text

      t.timestamps
    end
  end

  def self.down
    drop_table :lang_mappings
  end
end
