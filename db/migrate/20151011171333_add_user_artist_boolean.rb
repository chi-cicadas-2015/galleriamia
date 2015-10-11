class AddUserArtistBoolean < ActiveRecord::Migration
  def up
    add_column :users, :artist, :boolean, default: false
  end

  def down
    remove_column :users, :type_of_user
  end
end
