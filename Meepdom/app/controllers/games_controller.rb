class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  before_action :set_game, only: :show

  def index
    if params[:query].blank?
      @games = policy_scope(Game).order(created_at: :desc)
    else
      @games = policy_scope(Game).search_ncm(params[:query]).order(created_at: :desc)
    end
  end


  def show
    authorize @game
    @user_games = UserGame.where(game: @game)
  end



  private

  def set_game
    @game = Game.find(params[:id])
  end
end
