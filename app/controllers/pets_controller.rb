class PetsController < ApplicationController
  def show
  end

  def new
    @pet = current_user.pets.new
    authorize @pet
  end

  def create
    @pet = current_user.pets.new(pet_params)
    authorize @pet
    if pet.save
      redirect_to @pet
    else
      render :new
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :decription, :breed, :age)
  end

end
