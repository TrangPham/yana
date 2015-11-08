class StoriesController < ApplicationController
  before_action :authenticate_user!
  def new
    @story = Story.new
  end

  def create
    story = Story.new(entry_params)
    story.user_id = current_user.id
    if story.save!
      render json: { id: story.id }, status: :created
    else
      render json: { error: 'Unable to save story.' }, status: :unprocessable_entity
    end
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    story = Story.find(params[:id])
    if story.valid_user?(current_user) && story.update!(entry_params)
      render nothing: true, status: :ok
    else
      render json: { error: 'Unable to update story.' }, status: :unprocessable_entity
    end
  end

  def destroy
    if story.valid_user?(current_user)
      Story.find(params[:id]).destory
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
    story = params.require(:story)
    story.require(:content)
    story.permit(:tags, :title, :private)
  end
end
