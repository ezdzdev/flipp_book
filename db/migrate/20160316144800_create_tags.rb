class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :name,
               :limit => 1200,
               :null => false
      t.boolean :deleted, :null => false, :default => false
      t.string :description,
               :limit => 1200

      t.timestamps
    end

    add_index :tags, :name
  end

  def self.down
    drop_table :tags
  end
end
