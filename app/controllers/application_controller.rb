class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_admin_user!
    authenticate_user!
    redirect_to new_user_session_path unless current_user.admin?
  end
end
