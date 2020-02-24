class CreatePaintings < ActiveRecord::Migration[5.2]
  def change
    create_table :paintings do |t|
      t.string :artist
      t.string :title
      t.integer :price_per_day
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
