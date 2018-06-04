require_relative '../config/environment.rb'
require_relative '../models/film.rb'
class Parser
  def parse
    url = 'https://www.fandango.com/rss/newmovies.rss'
    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      feed.items.each do |item|
      Film.create(name: item.title)
      end
    end
  end
end
ps = Parser.new
ps.parse
