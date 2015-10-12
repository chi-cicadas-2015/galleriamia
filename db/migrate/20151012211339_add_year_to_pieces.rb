class AddYearToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :year, :string
  end
end
