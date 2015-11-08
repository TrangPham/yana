class PagesController < ApplicationController
  def home
  end

  def explore
    @stories = Story.all.order(vote: :desc) if user_signed_in?
  end
end
