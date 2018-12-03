class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :premiere_date
      t.string :length
      t.text :description
      t.string :genre
      t.string :director
      t.string :scenarist
      t.string :country

      t.timestamps
    end
  end
end
