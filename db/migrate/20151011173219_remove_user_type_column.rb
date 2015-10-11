class RemoveUserTypeColumn < ActiveRecord::Migration
  def change
    remove_column :users, :type_of_user
  end
end
