class Entry < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :tags
  has_one :vote

  validate :authorize_user

  private

  def authorize_user
    errors.add(:user, "user unauthorized to change entry") if current_user != user
  end
end
