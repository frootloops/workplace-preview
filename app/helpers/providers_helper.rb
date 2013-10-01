module ProvidersHelper

  def link_to_add_provider(provider)
    link_to t("users.providers.add", provider: provider), providers_path(provider: provider), method: :post
  end

end
