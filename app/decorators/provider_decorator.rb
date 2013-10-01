class ProviderDecorator < Draper::Decorator
  delegate_all

  def link_to_destroy
    h.link_to I18n.t("users.providers.destroy", provider: object.name), object, method: :delete
  end

end
