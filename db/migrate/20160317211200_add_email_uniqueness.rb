class AddEmailUniqueness < ActiveRecord::Migration
  def change
    change_column(:profiles, :email, :string, :limit => 254,
                  :index => true, :unique => true)
  end
end

