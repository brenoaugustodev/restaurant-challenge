class RatingsController < ApplicationController
  
  def new
    @rating = Rating.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    raise
    @rating = Rating.new(rating_params)
      if @rating.save 
        redirect_to restaurants_path
      else
        render :new
      end
  end

  def rating_params
    params.require(:rating).permit(:restaurant_id, :user)
  end
end
