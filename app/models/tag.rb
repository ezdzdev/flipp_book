class Tag < ActiveRecord::Base

  has_many :synonyms,
    :class_name => 'Synonym'

end


# tags
# t.string :name, :limit => 1200, :null => false
# t.boolean :deleted, :null => false, :default => false
# t.string :description, :limit => 1200
