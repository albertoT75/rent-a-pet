class RentsController < ApplicationController
  before_action :set_pet, only: [:new, :create]

  def new
    @rent = Rent.new
    #@rent = current_user.pet.new
    authorize @rent
  end

  def create
    @rent = Rent.new(rent_params)
    #@rent = current_user.pet.new(rent_params)
    @pet.rent = @rent
    authorize @rent
    if @rent.save
      redirect_to pet_path(@pet)
    else
      render :show
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
