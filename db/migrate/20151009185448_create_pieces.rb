class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :title
      t.string :size
      t.string :medium
      t.string :image_url_thumb
      t.string :url_full
      t.string :description


      t.timestamps null: false
    end
  end
end
