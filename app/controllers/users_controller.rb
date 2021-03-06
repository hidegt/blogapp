class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.page(params[:page]).reverse_order
  end
  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated your information successfully!!"
      redirect_to user_path(current_user.id)
    else
      render "edit"
    end
  end

  def follow
    @user = User.find(params[:id])
  end
  def follower
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
