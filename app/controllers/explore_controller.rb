class ExploreController < ApplicationController
  def index
    @stories = Story.all.order(:vote, :desc)
  end
end