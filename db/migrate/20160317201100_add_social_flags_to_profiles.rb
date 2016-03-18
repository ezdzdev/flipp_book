class AddSocialFlagsToProfiles < ActiveRecord::Migration
  def change
    add_column(:profiles, :facebook, :boolean, :default => false, :null => false)
    add_column(:profiles, :linkedin, :boolean, :default => false, :null => false)
  end
end

