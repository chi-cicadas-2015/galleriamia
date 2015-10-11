class RemoveUrlFieldsFromPieces < ActiveRecord::Migration
  def change
    remove_column :pieces, :image_url_thumb
    remove_column :pieces, :url_full
  end
end
