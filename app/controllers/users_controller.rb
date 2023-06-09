class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reports = @user.reports
  end

  def edit
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :section, :years, :profile_image)
  end
end
