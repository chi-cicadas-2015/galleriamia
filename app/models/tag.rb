class Tag < ActiveRecord::Base
  has_many :piece_tags
  has_many :pieces, through: :piece_tags
end
