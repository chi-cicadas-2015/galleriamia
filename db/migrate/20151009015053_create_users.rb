class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :statement
      t.string :avatar_url
      t.string :photo_url
      t.string :type_of_user

      t.references :artist, index: true

      t.timestamps null: false
    end
  end
end
