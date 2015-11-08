class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @comment = Comment.new(story_id: params[:story_id])
  end

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    if comment.save!
      render json: { id: comment.id, u_name: current_user.name }, status: :created
    else
      render json: { error: 'Unable to save comment.' }, status: :unprocessable_entity
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update!(story_params)
      render nothing: true, status: :ok
    else
      render json: { error: 'Unable to update comment.' }, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.valid_user?(current_user)
      comment.destory
      render nothing: true, status: :ok
    else
      render json: { error: 'Unable to delete comment.' }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.permit(:story_id, :content)
  end
end
