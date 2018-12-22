class CreateMovieSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_searches do |t|
      t.string :keywords
      t.string :genre
      t.string :director
      t.integer :min_length
      t.integer :max_length

      t.timestamps
    end
  end
end
