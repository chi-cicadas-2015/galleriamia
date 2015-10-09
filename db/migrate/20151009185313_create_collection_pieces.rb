class CreateCollectionPieces < ActiveRecord::Migration
  def change
    create_table :collection_pieces do |t|
      t.integer :collection_id
      t.integer :piece_id

      t.timestamps null: false
    end
  end
end
