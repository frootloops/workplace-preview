class ReservationTimestamp < ActiveRecord::Base
  validates :timestamp, presence: true
  validate :check_availability, if: -> { timestamp.present? }
  belongs_to :reservation

  def timestamp=(date_string)
    if date_string.present?
      datetime = Time.parse(date_string)
      raise ActiveRecord::AttributeAssignmentError unless datetime.min.zero?

      write_attribute(:timestamp, datetime)
    end
  end

  private

  def check_availability
    unless reservation.bookable?(timestamp.to_s)
      errors.add :timestamp, I18n.t("timestamp.taken", 
                                    scope: "activerecord.errors.models.reservation_timestamp.attributes")
    end
  end
end
