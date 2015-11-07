class Entry < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :tags
  has_one :vote

  validate :authorize_user

  before_create :set_created_at
  before_update :set_updated_at

  private

  def authorize_user
    errors.add(:user, 'Unauthorized User') if current_user != user
  end

  def set_created_at
    self.created_at = Time.now * 1000
  end

  def set_updated_at
    self.updated_at = Time.now * 1000
  end
end
