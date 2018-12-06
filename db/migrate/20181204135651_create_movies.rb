class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.integer :genre_id
      t.string :name
      t.date :premiere_date
      t.integer :length
      t.text :description
      t.string :genre
      t.string :director
      t.string :scenarist
      t.string :country
      t.timestamps
    end
  end
end
