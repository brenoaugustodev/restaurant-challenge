class RatingsController < ApplicationController


  def index
    @restaurants = Restaurant.all
  end
  
  def new
    if ((Time.now.strftime("%H:%M") < "09:00") || (Time.now.strftime("%H:%M") > "11:50" ))
      redirect_to restaurants_path, notice: "You cannot vote before 09:00 or after 11:50"
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
        redirect_to  restaurants_path, notice: "Rating was successfully created." 
      else
      render :new, status: :unprocessable_entity 
      end
  end
  
  def rating_params
    params.require(:rating).permit(:restaurant_id, :user)
  end
  
end

