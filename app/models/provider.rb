class Provider < ActiveRecord::Base
  belongs_to :user

  validates :uid, :name, presence: true
  validates :uid, uniqueness: { scope: :name }
end
