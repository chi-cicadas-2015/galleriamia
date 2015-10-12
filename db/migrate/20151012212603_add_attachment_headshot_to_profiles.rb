class AddAttachmentHeadshotToProfiles < ActiveRecord::Migration
  def self.up
    change_table :profiles do |t|
      t.attachment :headshot
    end
  end

  def self.down
    remove_attachment :profiles, :headshot
  end
end
