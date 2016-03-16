class Profile < ActiveRecord::Base
  has_and_belongs_to_many :tags,
                          :conditions => { :deleted => false }

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

end

#
#  string :name,
#         :limit => 1200
#  boolean :deleted, :null => false, :default => false
#  string   :image_url,
#           :limit => 1023
#
#  timestamps
#