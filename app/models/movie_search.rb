class MovieSearch < ApplicationRecord
  def movie_search
    movies = Movie.all

    movies = movies.where('name LIKE ?', "%#{keywords}%") if keywords.present?
    movies = movies.where('genre LIKE ?', genre ) if genre.present?
    movies = movies.where('director LIKE ?', "%#{director}%") if director.present?
    movies = movies.where('length >= ?', min_length) if min_length.present?
    movies = movies.where('length =< ?', max_length) if max_length.present?

    return movies
  end
end
