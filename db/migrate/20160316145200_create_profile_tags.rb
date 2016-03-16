class CreateProfileTags < ActiveRecord::Migration
  def self.up
    create_table :profile_tags do |t|
      t.integer :profile_id, :null => false
      t.integer :tag_id, :null => false
    end

    add_index :profile_tags, [:profile_id, :tag_id]
  end

  def self.down
    drop_table :profile_tags
  end
end
