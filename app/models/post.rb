class Post < ActiveRecord::Base
  validates :title, :body, presence: true

  scope :chronological, -> { order(created_at: :desc) }
end
