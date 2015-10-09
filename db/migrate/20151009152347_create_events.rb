class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :event_url
      t.string :event_address
      t.string :event_city
      t.string :event_zip
      t.string :host
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
