require "open-uri"


class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @games = Game.first(3)
  end

  def index
    @games = Game.all
  end

end
