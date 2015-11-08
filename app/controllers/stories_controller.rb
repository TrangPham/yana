require 'net/http'
require 'uri'

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
      response = es_request(story)
      es_format_response(response)
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
  def es_request(story_obj)
    url = URI.parse('http://localhost:9200/yana/entry')
    req = Net::HTTP::Post.new(url.request_uri)
    req.set_form_data({'title'=>story_obj.title, 'content'=>story_obj.content, 'user_id'=>story_obj.user_id, 'created_at'=>story_obj.created_at, 'updated_at'=>story_obj.updated_at})
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = (url.scheme == "https")
    response = http.request(req)
    response.body
  end
  def es_format_response(response)
    response
  end

  def story_params
    params.permit(:tags, :title, :content)
  end
end
