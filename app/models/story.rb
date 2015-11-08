class Story < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :tags
  has_one :vote

  before_create :set_created_at
  before_update :set_updated_at

  private

  def valid_user?(user)
    user_id == user.id
  end

  def set_created_at
    return unless created_at.blank?

    time = Time.now
    self.created_at = time
    self.updated_at = time
  end

  def set_updated_at
    self.updated_at = Time.now
  end
end
