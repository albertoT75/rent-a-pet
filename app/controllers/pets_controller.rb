class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update]
  def edit
    authorize @pet
  end

  def show
    authorize @pet
  end

  def update
    authorize @pet
    if @pet.update(pet_params)
      flash[:success] = "Pet updated!"
      redirect_to pet_path(@pet)
    else
      render :edit
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :description, :breed, :age, :photo)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
