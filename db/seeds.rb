require_relative '../config/environment'

genres = ["Биографический", "Боевик", "Вестерн", "Военный", "Детектив", "Детский", "Документальный", "Драма", "Исторический", "Комедия"].map do |genre|
  Genre.create genre: genre
end
