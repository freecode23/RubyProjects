require 'nokogiri'
require 'open-uri'

def fetch_top_five
  url = "http://www.imdb.com/chart/top"
  base_url = "http://www.imdb.com"

# save the url to the variable
  html = open(url, "Accept-Language" => "en").read
# open the url and read it => html
  doc = Nokogiri::HTML(html)
# compare to nokogiri => nokogiri object

  doc.search(".titleColumn a").take(5).map do |element|
  p  base_url + element.attribute("href").value.split("?").first
  end

# search through the objects for url
# take the top 5 and iterate over them
# push them to the array
# return the array

end

def scrape_movie(url)
  html = open(url, "Accept-Language" => "en").read
  doc = Nokogiri::HTML(html)
  # create an empty
  movie = {}
  # search for the title, director, storyline, cast, and year
  movie[:storyline] = doc.search(".summary_text").first.text.strip
  movie[:director] = doc.search(".credit_summary_item a").first.text.strip
  movie[:cast] = doc.search(".credit_summary_item").last.search("a").take(3).map do |element|
    element.text.strip
  end
  movie[:year] = doc.search("#titleYear a").text.strip.to_i
  movie[:title] = doc.search(".title_wrapper h1").first.children.first.text.strip

  movie
end


puts scrape_movie('https://www.imdb.com/title/tt0468569/')
fetch_top_five

