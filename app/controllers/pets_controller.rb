class PetsController < ApplicationController

  def show
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def new
    @pet = current_user.pets.new
    authorize @pet
  end

  def create
    @pet = current_user.pets.new(pet_params)
    authorize @pet
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :description, :breed, :age)
  end
end
