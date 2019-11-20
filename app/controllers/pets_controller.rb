class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = policy_scope(Pet).geocoded #returns pets with coordinates

    @markers = @pets.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude
      }
    end
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
    @pet.delete
    redirect_to root_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :description, :breed, :age, :address, :photo)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
