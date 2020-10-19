# The one line comment below is the creating command
# $ rails generate scaffold car make:string model:string year:integer
# Migration
# $ rails ds:migrate
# Initiate server
# $ rails server
# Create git repo, push everything in
# Create heroku connection
# $ heroku create
# After modification
# $ bundle install --without production
# Rails to heroku
# $ heroku run rails db:migrate
# Open the heroku website
# $ heroku open
# To see the secret codes
# $ rails secret
# To see extended routes and helpers
# $ rails routes
class CarsController < ApplicationController
# The default layout for CarsController can be changed here via following
# layout "different"
# This will look for different.html.erb in layouts folder
# The default for all controllers can be changed at ApplicationController
# The layout can be varied via a method as well layout
# layout :switch_layout
# private
# def switch_layout
# ...
# end
# inline method or conditional layouts are also possible
# layout false; will remove any inhereted layout
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
# Following is an example of a reliable render/redirect
=begin
    @cars = Car.find(:make)
    if @car.nil?
      @car = Car.all
      flash.now[:alert] = "The car is not found"
      render :index
    end
=end
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.json
  def create
    #@car = Car.new(car_params)
# Changing above statement to work only with whitelisted parameters
    @car = Car.new(whitelisted_car_params)

    respond_to do |format|
      if @car.save
# The flash occurs only once and cleared in the next call
# success, notice and error are three main conventional keys
# notice and error are used below as well
        flash[:success] = "Great job, creating new car."
# The flash value can be reused via flash.keep or flash.keep(:success)
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
# redirect goes to a page and does not carry any info unless specified
# redirect_back can return user to a previous location
# redirect_back(fallback_location: root_path) is a better way to use
        format.json { render :show, status: :created, location: @car }
      else
# flash.now is used to flash in the current page
# The reason is that render :new will not make a new request
        flash.now[:error] = "There is a mistake, dude."
        format.html { render :new }
# copy all good info and expect to fullfill missing requirements
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
# redirect or render does not stop the method, they are not returns
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
# helper methods are usually here -> private

    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:make, :model, :year)
    end
# gives back the hash containing params needed to create or update a car
    def whitelisted_car_params
      params.require(:car).permit(:make, :model, :year)
    end
end
