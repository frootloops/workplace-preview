class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do
    redirect_to root_path, alert: t("access.denied")
  end

  def current_ability
    @current_ability ||= AbilityFactory.build current_user
  end
end
