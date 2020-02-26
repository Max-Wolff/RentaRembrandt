class AddCoordinatesToPaintings < ActiveRecord::Migration[5.2]
  def change
    add_column :paintings, :latitude, :float
    add_column :paintings, :longitude, :float
  end
end
