class StoriesController < ApplicationController
  before_action :authenticate_user!
  def new
    @story = Story.new
  end

  def create
    story = Story.new(story_params)
    story.user_id = current_user.id
    story.private = params[:private] == 'on'
    if story.save!
      render json: { id: story.id }, status: :created
    else
      render json: { error: 'Unable to save story.' }, status: :unprocessable_entity
    end
  end

  def show 
    @story = Story.find_by_id(params[:id])
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    story = Story.find(params[:id])
    if story.valid_user?(current_user) && story.update!(story_params)
      render nothing: true, status: :ok
    else
      render json: { error: 'Unable to update story.' }, status: :unprocessable_entity
    end
  end

  def destroy
    story = Story.find(params[:id])
    if story.valid_user?(current_user)
      story.destory
      render nothing: true, status: :ok
    else
      render json: { error: 'Unable to delete story.' }, status: :unprocessable_entity
    end
  end

  def vote
    Story.find(params[:id]).vote
    render nothing: true, status: :ok
  end

  private

  def story_params
    params.permit(:tags, :title, :content)
  end
end
