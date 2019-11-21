class RentsController < ApplicationController
  before_action :set_pet, only: [:new, :create, :dashboard]

  def new
    @rent = Rent.new
    authorize @rent
  end

  def create
    @rent = Rent.new(rent_params)
    authorize @rent
    @rent.pet_id = @pet.id
    @rent.user = current_user
    if @rent.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def rent_params
    params.require(:rent).permit(:start_period, :end_period)
  end
end
