class CreateGenresMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :genres_movies do |t|
      t.references :genre, index: true
      t.references :movie, index: true
    end
  end
end
