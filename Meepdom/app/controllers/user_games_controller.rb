class UserGamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_user_game, only: [:show, :edit, :update, :destroy]
  # before_action :sold_by, only: [:show]

  def index
    @user_games = policy_scope(UserGame).order(created_at: :desc)
    @user = User.find(params[:user_id])
    @user_game = UserGame.new
    authorize @user_game
  end

  def show
    authorize @user_game
  end

  def edit
    authorize @user_game
  end

  def new
    @user_game = current_user.user_games.new
    authorize @user_game
  end

  def create
    @user = User.find(current_user.id)
    @user_game = current_user.user_games.new(user_game_params)

    authorize @user_game
    # binding.pry
    if @user_game.save
      # redirect_to user_user_games_path(@user)
      respond_to do |format|
        format.html { redirect_to user_user_games_path(@user) }
        format.js  # <-- will render `app/views/user_games/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.js  # <-- idem
      end
    end
  end

  def update
    @user_game.update(user_game_params)
    authorize @user_game
    if @user_game.save
      redirect_to user_game_path(@user_game)
    else
      render :edit
    end
  end

  def destroy
    @user_game.destroy
    authorize @user_game
    # raise
    redirect_to user_user_games_path(current_user)
  end

  private

  def user_game_params
    params.require(:user_game).permit(
      :photo,
      :sale_price,
      :description,
      :game_id,
      :condition
    )
  end

  def set_user_game
    @user_game = UserGame.find(params[:id])
  end
end
