class Promo < ActiveRecord::Base
  validates :title, :body, :start_at, :end_at, presence: true

  scope :actual, -> { where("start_at < :today AND end_at > :today", today: DateTime.current) }
  scope :archived, -> { where("end_at < ?", DateTime.current) }
end
