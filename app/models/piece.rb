class Piece < ActiveRecord::Base
  has_many :collection_pieces
  has_many :collections, through: :collection_pieces

  has_many :piece_tags
  has_many :tags, through: :piece_tags
end
