class Profile < ActiveRecord::Base
  has_and_belongs_to_many :tags,
                          :conditions => { :deleted => false }

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true

  class << self
    def search(term)
      # TODO Either make this faster or make this a scope.
      Profile.order('name desc').where('profiles.name LIKE ?', "%#{term}%")
    end
  end

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def add_tags(names)
    names = names.split(",") if name.is_a? String

    new_tags = names.map{ |name|
      tag = Tag.where(name: name.strip).first_or_create!
      self.tags.include?(tag) ? nil : tag
    }.compact

    self.tags << new_tags

    new_tags
  end

  def remove_tags(names)
    names = names.split(",") if name.is_a? String

    tags_to_remove = names.map{ |name|
      tag = Tag.where(name: name.strip).first
      self.tags.include?(tag) ? tag : nil
    }.compact

    self.tags = self.tags - tags_to_remove

    tags_to_remove
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
