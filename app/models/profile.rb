class Profile < ActiveRecord::Base

  has_many :tags,
    :through => Profile::Tag

  has_many :profile_tags,
           :class_name => "::Profile::Tag",
           :conditions => {:deleted => false}
  has_many :tags, :through => :profile_tags

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
