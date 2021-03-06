class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name,
               :limit => 256,
               :index => true

      t.string :role,
               :limit => 256,
               :index => true

      t.string :image_url,
               :limit => 1023

      t.string :email,
               :limit => 254,
               :index => true

      t.string :phone_number,
               :limit => 20

      t.timestamps
    end
  end
end
