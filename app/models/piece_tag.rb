class PieceTag < ActiveRecord::Base
  belongs_to :piece
  belongs_to :tag
end
