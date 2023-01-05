class RatingsController < ApplicationController


  def index
    @restaurants = Restaurant.all
  end
  
  def new
    if ((Time.now.strftime("%H:%M") < "09:00") || (Time.now.strftime("%H:%M") > "18:50" ))
      redirect_to restaurants_path, notice: " SORRY. YOU CAN VOTE ONLY BETWEEN 09:00 AM TO 11:50 AM"
    else
      @rating = Rating.new
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @rating = Rating.new(rating_params)
    @rating.restaurant_id = params[:restaurant_id]
      if @rating.save
        redirect_to  root_path, notice: "Thank you! Your vote was counted" 
      else
      render :new, status: :unprocessable_entity 
      end
  end
  
  def rating_params
    params.require(:rating).permit(:restaurant_id, :user)
  end
  
end

