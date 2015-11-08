class PagesController < ApplicationController
  def home
  end

  def explore
    @stories = Story.includes(:comments).all.order(votes: :desc) if user_signed_in?
  end

  def profile
    if user_signed_in?
      @user = current_user
      @stories = Story.includes(:comments).where(user_id: current_user.id)
    end
  end
end
