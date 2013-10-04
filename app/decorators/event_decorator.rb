class EventDecorator < Draper::Decorator
  delegate_all

  def link_to_leave
    h.link_to I18n.t("views.event.leave"), h.event_event_user_path(object, event_user), method: :delete if event_user
  end

  def link_to_join
    h.link_to I18n.t("views.event.join"), h.event_event_users_path(object), method: :post unless event_user
  end

  private

  def event_user
    object.event_users.find_by(user: h.current_user)
  end

end
