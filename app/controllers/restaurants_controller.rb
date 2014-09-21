class RestaurantsController < ApplicationController

	before_action :authenticate_user!, only: [:create, :new, :edit, :update]

	def index
    @restaurants = current_user.restaurants.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @restaurants }
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @restaurant }
    end
  end

  def new
    @restaurant = Restaurant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @restaurant }
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = current_user.restaurants.new(restaurant_parameters)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render json: @restaurant, status: :created, location: @restaurant }
      else
        format.html { render action: "new" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      if @restaurant.update_attributes(restaurant_parameters)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to restaurants_url }
      format.json { head :no_content }
    end
  end

	private
	  def restaurant_parameters
	    params.require(:restaurant).permit(:name, :category, :address, :city, :country, :zip)
	  end
end
