require 'net/http'

class Story < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  before_create :set_created_at
  before_update :set_updated_at

  before_save :presist_to_nosql

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

  def presist_to_nosql
    # http = Net::HTTP.new('localhost', '54321')
    # request = Net::HTTP::Post.new('api/entry')
    # request.add_field('Content-Type', 'application/json')
    # request.body = {'credentials' => {'username' => 'username', 'key' => 'key'}}
    # response = http.request(request)
  end
end
