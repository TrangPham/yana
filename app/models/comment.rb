class Comment < ActiveRecord::Base
  belongs_to :entry

  validates :entry, presence: true
end
