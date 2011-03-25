class CreateLikeButtons < ActiveRecord::Migration
  def self.up
    create_table :like_buttons do |t|
      t.string :label

      t.timestamps
    end
  end

  def self.down
    drop_table :like_buttons
  end
end
