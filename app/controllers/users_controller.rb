class UsersController < ApplicationController
  def index
    render json: { api: :ok }
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: { user: @user }
    else
      render json: { errors: @user.errors }
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
