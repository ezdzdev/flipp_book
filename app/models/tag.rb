class Tag < ActiveRecord::Base
  has_and_belongs_to_many :profiles,
                          :conditions => { :deleted => false }

  validates :name, :presence => true, :uniqueness => true,
            :format => {:with => /[a-z0-9]+/}

  class << self
    def search(term)
      # TODO Either make this faster or make this a scope.
      Tag.joins('LEFT JOIN (
                   SELECT p.id, p.name, p.image_url, pt.tag_id FROM profiles_tags pt
                   INNER JOIN profiles p on pt.profile_id=p.id
                 ) ptp ON tags.id = ptp.tag_id').
        group('tags.name').
        select('tags.id, tags.name, tags.description, COUNT(*) user_count').
        order('user_count desc').
        where('tags.name LIKE ?', "%#{term}%")
    end
  end

end

# tags
# t.string :name, :limit => 1200, :null => false
# t.boolean :deleted, :null => false, :default => false
# t.string :description, :limit => 1200
