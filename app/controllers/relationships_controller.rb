class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:follow_id])
    following = current_user.follow(user)
    if following.save
      flash[:notice] = "You followed this user"
      redirect_to user
    else
      flash.now[:notice] ="You missed following this user"
      redirect_to user
    end
  end

  def destroy
    user = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    if following.destroy
      flash[:notice] = "You released follow this user"
      redirect_to user
    else
      flash.now[:notice] ="You missed to release following this user"
      redirect_to user
    end
  end

end
