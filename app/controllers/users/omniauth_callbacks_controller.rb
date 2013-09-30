class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def provider
    @user = UserRegistration.new(request.env["omniauth.auth"]).find_for_provider

    if @user.persisted? || @user.save
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: __callee__
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.omniauth"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_path
    end
  end

  alias_method :facebook, :provider
  alias_method :twitter, :provider

end
