class LocationListsController < ApplicationController
  before_action :set_location_list, only: [:show, :edit, :update, :destroy]

  # GET /location_lists
  # GET /location_lists.json
  def index
    @location_lists = LocationList.all
  end

  # GET /location_lists/1
  # GET /location_lists/1.json
  def show
  end

  # GET /location_lists/new
  def new
    @location_list = LocationList.new
  end

  # GET /location_lists/1/edit
  def edit
  end

  # POST /location_lists
  # POST /location_lists.json
  def create
    @location_list = LocationList.new(location_list_params)
    @location_list.profile_id = current_user.profile.id

    respond_to do |format|
      if @location_list.save
        format.html { redirect_to @location_list, notice: 'Location list was successfully created.' }
        format.json { render :show, status: :created, location: @location_list }
      else
        format.html { render :new }
        format.json { render json: @location_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location_lists/1
  # PATCH/PUT /location_lists/1.json
  def update
    respond_to do |format|
      if @location_list.update(location_list_params)
        format.html { redirect_to @location_list, notice: 'Location list was successfully updated.' }
        format.json { render :show, status: :ok, location: @location_list }
      else
        format.html { render :edit }
        format.json { render json: @location_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_lists/1
  # DELETE /location_lists/1.json
  def destroy
    @location_list.destroy
    respond_to do |format|
      format.html { redirect_to location_lists_url, notice: 'Location list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_list
      @location_list = LocationList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_list_params
      params.require(:location_list).permit(:profile_id, :location_id)
    end
end
