require 'open-uri'
require 'json'

class GamesController < ApplicationController
  # MESSAGE = {
  #   1 => { sentence: 'well done' },
  #   2 => { sentence: 'not an english word' },
  #   3 => { sentence: 'not in the grid' }
  # }

  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    # render plain: "Add to DB words '#{params[:guess]}'"
    # guess = params[:guess]
    # response = open("https://wagon-dictionary.herokuapp.com/#{guess}")
    # json = JSON.parse(response.read)
    # english = json['found']
    @letters = params[:letters].split(" ")
  #   if guess.chars.all? { |letter| guess.count(letter) <= @letters.count(letter) }
  #     if english
  #       @message = 'well done'
  #     else
  #       @message = 'not an english word'
  #     end
  #   else
  #     @message = 'not in the grid'
  #   end
  end

end
