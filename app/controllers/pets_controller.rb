class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
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

  def destroy
    authorize @pet
    if @pet.delete
      # TODO: change path to pets_path when index is done
      redirect_to root_path
    else
      render :show
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
