class UsersController < ApplicationController
  def show
    if user_signed_in?
      if params[:id] == current_user.id
        @user = current_user
        @stories = Story.includes(:comments).where(user_id: current_user.id)
      else
        @user = User.find(params[:id])
        @stories = Story.includes(:comments).where(user_id: params[:id], private: false)
      end
    end
  end
end
