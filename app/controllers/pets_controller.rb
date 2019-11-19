class PetsController < ApplicationController

def edit
  @user = current_user
  @pet = Pet.find(params[:id])
end

def show
  @pet = Pet.find(params[:id])
  authorize @pet
end

def update
  @user = current_user
  @pet = @user.pet.find(params[:id])
  if @pet.update_attributes(pet_params)
    flash[:success] = "Pet updated!"
  else
    render action: :edit
  end
end

def pet_params
  params.require(:pet).permit(:name, :description, :breed, :age, :photo)
end

end
