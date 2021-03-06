class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy, :allowed_to_create_reviews?]

  def index
    @pets = policy_scope(Pet).geocoded #returns pets with coordinates
    # Search bar start
    if params[:query].present?
      sql_query = "name ILIKE :query or breed ILIKE :query or address ILIKE :query"
      @pets = @pets.where(sql_query, query: "%#{params[:query]}%")
      if @pets.exists?
        return @pets
      else
        redirect_to root_path(message: "Sorry not pet available")
      end
    end
    # Search bar end
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
    @rent = Rent.new
    @review = Review.new
    @condition = (Rent.where("pet_id = ? AND user_id = ?", params[:id], current_user.id).count > 0)
    @markers = [{lat: @pet.latitude, lng: @pet.longitude}]
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
    params.require(:pet).permit(:name, :description, :breed, :age, :address, :photo, :price)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
