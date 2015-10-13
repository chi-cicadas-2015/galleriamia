class Profile < ActiveRecord::Base

  belongs_to :artist, class_name: "User"

  has_attached_file :headshot,
                    :styles => { :thumb => "100x100>"}
  validates_attachment_content_type :headshot, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :headshot, matches: [/png\Z/, /PNG\Z/, /jpe?g\Z/, /JPE?G\Z/]
end
