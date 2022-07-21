class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
   # @restaurants = Restaurant.all
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save!
      redirect_to restaurants_path
    else
      render :new
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
