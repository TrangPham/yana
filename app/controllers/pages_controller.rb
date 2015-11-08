class PagesController < ApplicationController
  def home
  end

  def explore
    @stories = Story.includes(:comments).all.order(votes: :desc) if user_signed_in?
  end
end
