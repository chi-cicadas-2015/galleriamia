class AddAttachmentPhotoToPieces < ActiveRecord::Migration
  def self.up
    change_table :pieces do |t|
      t.attachment :photo
    end
  end

  def create

  end

  def self.down
    remove_attachment :pieces, :photo
  end
end
