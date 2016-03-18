class AddLocationToProfiles < ActiveRecord::Migration
  def change
    add_column(:profiles, :location, :string, :limit => 254)
  end
end

