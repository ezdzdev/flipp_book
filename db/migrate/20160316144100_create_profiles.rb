class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :name,
               :limit => 256
      t.boolean :deleted, :null => false, :default => false
      t.string   :image_url,
                 :limit => 1023
      t.string :email,
               :limit => 254
      t.string :phone_number,
               :limit => 20

      t.timestamps
    end

    add_index :profiles, :name
  end

  def self.down
    drop_table :profiles
  end
end
