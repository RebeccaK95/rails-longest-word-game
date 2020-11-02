require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    i = 0
   while i < 10
      letter = ('a'..'z').to_a.sample
      @letters << letter
      i += 1
    end
  end

  def score
    @word = params[:score]
    @letters = params[:letters].split

    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    resp = URI.open(url)
    @hash = JSON.parse(resp.read)

    @included = @word.chars.all? do |letter|
      @word.count(letter) <= @letters.count(letter)
    end
  end
end
