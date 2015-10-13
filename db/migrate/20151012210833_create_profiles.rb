class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :top_collection
      t.string :website_url
      t.string :primary_medium

      t.timestamps null: false
    end
  end
end
