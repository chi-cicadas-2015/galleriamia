class RemoveUrlColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :avatar_url
    remove_column :users, :photo_url
  end
end
