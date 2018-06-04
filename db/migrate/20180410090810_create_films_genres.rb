class CreateFilmsGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :films_genres do |t|
      t.references :film, index: true, foreign_key: true
      t.references :genre, index: true, foreign_key: true
    end
  end
end
