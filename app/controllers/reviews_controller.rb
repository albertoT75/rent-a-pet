class ReviewsController < ApplicationController
  
  def create
    @pet = Pet.find(params[:pet_id])
    authorize @pet
    @condition = (Rent.where("pet_id = ? AND user_id = ?", params[:pet_id], current_user.id).count > 0)
    if @condition
      @review = Review.new(review_params)
      @review.pet = @pet
      authorize @review
      if @review.save
        redirect_to pet_path(@pet)
      end
    else
      redirect_to pet_path(@pet), :notice => "You can not leave a review! You have not rented this pet!"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end