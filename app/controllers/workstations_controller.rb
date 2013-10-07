class WorkstationsController < ApplicationController
  load_and_authorize_resource except: [:create]

  def create
    @workstation = Workstation.new workstation_params

    if @workstation.save
      redirect_to workstations_path
    else
      render :new
    end
  end

  def update
    if @workstation.update workstation_params
      redirect_to workstations_path
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @workstation.destroy
    redirect_to :back
  end

  def new
  end

  private

  def workstation_params
    params.require(:workstation).permit(:name, :service_id, :place_id)
  end
end
