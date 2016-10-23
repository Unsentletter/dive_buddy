class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # Cacncancan not authorised redirect to root
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  # GET /locations
  # GET /locations.json
  def index
    if !user_signed_in?
      redirect_to new_user_registration_path
    elsif current_user.profile.nil?
      @profile = Profile.new
      redirect_to new_profile_path
    else
      @locations = Location.all
    end

  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @nearbys = Location.near([@location.latitude, @location.longitude], 20, :units => :km)
    @location_list = LocationList.new
    @locations = Location.all
    @location_reviews = @location.location_reviews
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)
    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:location_name, :description, :depth, :difficulty, :latitude, :longitude, :location_lists_id)
    end
end
