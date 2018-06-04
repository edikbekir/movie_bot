class Genre < ActiveRecord::Base
  has_and_belongs_to_many :films

  def self.get_genre(arr = [])
    Genre.all.each do |a|
      arr << a.genre.to_s
    end
    arr
  end
end
