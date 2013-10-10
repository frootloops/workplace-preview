class Master < User
  default_scope -> { joins(:user_services) }

  has_many :samples, dependent: :destroy

  accepts_nested_attributes_for :samples, reject_if: :all_blank, allow_destroy: true

  def self.find_by_user!(id)
    Master.unscoped.find(id)
  end

end
