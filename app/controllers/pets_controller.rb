class PetsController < ApplicationController

def edit
  @user = current_user
  @pet = Pet.find(params[:id])
  authorize @pet
end

def show
  @pet = Pet.find(params[:id])
  authorize @pet
end

def update
  @pet = Pet.find(params[:id])
  authorize @pet
  if @pet.update(pet_params)
    flash[:success] = "Pet updated!"
    redirect_to pet_path(@pet)
  else
    render :edit
  end
end

def pet_params
  params.require(:pet).permit(:name, :description, :breed, :age, :photo)
end

end
