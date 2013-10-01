class Users::RegistrationsController < Devise::RegistrationsController
  def update
    if current_user.update_attributes user_params
      set_flash_message :notice, :updated
      sign_in current_user, bypass: true
      redirect_to after_update_path_for(current_user)
    else
      render "edit"
    end
  end

  private

  def user_params
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

 end
