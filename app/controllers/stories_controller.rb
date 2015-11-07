class StoriesController < ApplicationController
  def new
    @entry = Story.new
  end

  def create
    entry = Story.new(entry_params)
    entry.user = current_user
    if entry.save!
      render json: { id: entry.id }, status: :created
    else
      render json: { error: 'Unable to save entry.' }, status: :unprocessable_entity
    end
  end

  def edit
    @entry = Story.find(params[:id])
  end

  def update
    entry = Story.find(params[:id])
    if entry.update!(entry_params)
      render nothing: true, status: :ok
    else
      render json: { error: 'Unable to update entry.' }, status: :unprocessable_entity
    end
  end

  def destroy
    Story.find(params[:id]).destory
  end

  private

  def story_params
    story = params.require(:story)
    story.require(:content)
    story.permit(:tags, :title)
  end
end
