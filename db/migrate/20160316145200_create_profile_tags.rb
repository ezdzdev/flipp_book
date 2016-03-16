class CreateProfileTags < ActiveRecord::Migration
  def change
    create_table :profiles_tags do |t|
      t.belongs_to :profile, index: true
      t.belongs_to :tag, index: true
    end
  end
end

