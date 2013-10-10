class MastersController < ApplicationController
  load_and_authorize_resource :master, only: [:show, :index]
  load_and_authorize_resource find_by: :user, only: [:edit, :update]

  def show
    @samples = @master.samples.includes(:service)
  end

  def index
  end

  def edit
  end

  def update
    if @master.update master_params
      redirect_to @master
    else
      render :edit
    end
  end

  private

  def master_params
    params.require(:master).permit(samples_attributes: [:id, :file, :service_id, :_destroy])
  end

end
