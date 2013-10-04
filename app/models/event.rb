class Event < ActiveRecord::Base
  validates :body, :scheduled_at, :section_cd, presence: true

  as_enum :section, [:master_class, :workshop, :lecture, :exhibition, :performance]

  mount_uploader :poster, PosterUploader
end
