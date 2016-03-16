class Profile::Tag < ActiveRecord::Base

  belongs_to :profile_id,
    :class_name => "Profile",
    :foreign_key => :profile_id
  belongs_to :tag,
    :class_name => "Tag",
    :foreign_key => :tag_id

end
