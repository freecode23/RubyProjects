class PurchasesController < ApplicationController
  # anyone can call this actions
  skip_before_action :authenticate_user!, only: [:index]
  # anyone can execute this action -
  # if its false in the policy, then you cannot execute the action.
  # policy is prioritized more than skip
  skip_after_action :verify_authorized

  def index
    @user = current_user
    @purchases = policy_scope(Purchase)
  end

  def new
    @user_game = UserGame.find(params[:user_game_id])
    @purchase = Purchase.new
  end

  def show
    @purchase = Purchase.find(params[:purchase_id])
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user = current_user
    @purchase.user_game = UserGame.find(params[:user_game_id])
    if @purchase.save
      redirect_to user_path(current_user)
    else
      render '/purchases'
    end
  end

  def purchase_params
    params.require(:purchase).permit(:payment_method, :delivery_type)
  end
end
