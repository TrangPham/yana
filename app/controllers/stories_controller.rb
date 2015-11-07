class StoriesController < ApplicationController
  def new
    @entry = Entry.new(user: current_user)
  end

  def create
    entry = Entry.new(entry_params)
    entry.user = current_user
    if entry.save!
      render json: { id: entry.id }, status: :created
    else
      render json: { error: 'Unable to save entry.' }, status: :unprocessable_entity
    end
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    entry = Entry.find(params[:id])
    if entry.update!(entry_params)
      render nothing: true, status: :ok
    else
      render json: { error: 'Unable to update entry.' }, status: :unprocessable_entity
    end
  end

  def destroy
    Entry.find(params[:id]).destory
  end

  private

  def entry_params
    entry = params.require(:entry)
    entry.require(:content)
    entry.permit(:tags, :title)
  end
end
