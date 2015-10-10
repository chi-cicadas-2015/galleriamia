class AddPieceArtistColumn < ActiveRecord::Migration
  def change
    add_column :pieces, :artist_id, :integer
  end
end
