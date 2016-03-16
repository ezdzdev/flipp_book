class CreateSynonymsTable < ActiveRecord::Migration
  def change
    create_table :synonyms do |t|
      t.belongs_to :tags
      t.string :name, null: false
    end
  end
end
