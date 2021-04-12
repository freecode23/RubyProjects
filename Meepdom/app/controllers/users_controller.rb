class UsersController < ApplicationController
  before_action :set_user, only: [ :show ]
  skip_after_action :verify_authorized

  def show
    # authorize @user
    skip_authorization
  end

  def update
    authorize @user
    @user.update(user_params)

    if @user.save
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
