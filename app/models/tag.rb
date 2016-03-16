class Tag < ActiveRecord::Base
  has_and_belongs_to_many :profiles,
                          :conditions => { :deleted => false }
end

# tags
# t.string :name, :limit => 1200, :null => false
# t.boolean :deleted, :null => false, :default => false
# t.string :description, :limit => 1200
