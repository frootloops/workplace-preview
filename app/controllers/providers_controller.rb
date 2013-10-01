class ProvidersController < ApplicationController
  load_and_authorize_resource except: :create

  def create
    redirect_to user_omniauth_authorize_path(params[:provider])
  end

  def destroy
    @provider.destroy
    redirect_to :back
  end

end
