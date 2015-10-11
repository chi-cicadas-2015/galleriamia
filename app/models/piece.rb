class Piece < ActiveRecord::Base
  belongs_to :artist, class_name: User

  has_many :collection_pieces
  has_many :collections, through: :collection_pieces

  has_many :piece_tags
  has_many :tags, through: :piece_tags

  has_attached_file :photo,
                    :styles => { :thumb => "100x100>",
                                 :large => "300x300>"}
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :photo, matches: [/png\Z/, /PNG\Z/, /jpe?g\Z/, /JPE?G\Z/]
end
