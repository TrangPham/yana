class Comment < ActiveRecord::Base
  belongs_to :story
  belongs_to :user

  validates :user, presence: true
  validates :story, presence: true
end
