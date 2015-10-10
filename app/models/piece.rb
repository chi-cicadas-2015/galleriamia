class Piece < ActiveRecord::Base
  belongs_to :artist, class_name: User

  has_many :collection_pieces
  has_many :collections, through: :collection_pieces

  has_many :piece_tags
  has_many :tags, through: :piece_tags
end
