class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name,
               :limit => 256,
               :null => false

      t.string :description,
               :limit => 1200

      t.timestamps
    end

    add_index :tags, :name
  end
end
