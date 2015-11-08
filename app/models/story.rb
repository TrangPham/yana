require 'net/http'
require 'uri'

class Story < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  before_create :set_created_at
  before_update :set_updated_at

  before_save :presist_to_es

  def valid_user?(user)
    user_id == user.id
  end

  def vote
    self.vote = vote + 1
  end

  private

  def set_created_at
    return unless created_at.blank?

    time = Time.now
    self.created_at = time
    self.updated_at = time
  end

  def set_updated_at
    self.updated_at = Time.now
  end

  def presist_to_es
    url = URI.parse('http://localhost:54321/api/entry')
    request = Net::HTTP::Post.new(url.request_uri)
    http = Net::HTTP.new(url.host, url.port)

    story = {
      'title' => title,
      'content' => content,
      'user_id' => user_id,
      'created_at' => created_at,
      'updated_at' => updated_at,
      # 'tags'=>"xyz"
      'tags' => tags.split(',').map(&:strip)
    }
    request.set_form_data('payload' => story.to_json)

    response = http.request(request)
    if response.code != "200"
      errors.add(:id, 'Could not presist to Elastic Search DB.')
    end
  end
end
