class UserService < ActiveRecord::Base
  validates :user, :service, presence: true

  belongs_to :user
  belongs_to :service
end
