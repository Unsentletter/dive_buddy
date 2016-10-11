class LocationReviewsController < ApplicationController
  before_action :set_location_review, only: [:show, :edit, :update, :destroy]

  # GET /location_reviews
  # GET /location_reviews.json
  def index
    @location_reviews = LocationReview.all
  end

  # GET /location_reviews/1
  # GET /location_reviews/1.json
  def show
  end

  # GET /location_reviews/new
  def new
    @location_review = LocationReview.new
  end

  # GET /location_reviews/1/edit
  def edit
  end

  # POST /location_reviews
  # POST /location_reviews.json
  def create
    @location_review = LocationReview.new(location_review_params)

    respond_to do |format|
      if @location_review.save
        format.html { redirect_to @location_review, notice: 'Location review was successfully created.' }
        format.json { render :show, status: :created, location: @location_review }
      else
        format.html { render :new }
        format.json { render json: @location_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location_reviews/1
  # PATCH/PUT /location_reviews/1.json
  def update
    respond_to do |format|
      if @location_review.update(location_review_params)
        format.html { redirect_to @location_review, notice: 'Location review was successfully updated.' }
        format.json { render :show, status: :ok, location: @location_review }
      else
        format.html { render :edit }
        format.json { render json: @location_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_reviews/1
  # DELETE /location_reviews/1.json
  def destroy
    @location_review.destroy
    respond_to do |format|
      format.html { redirect_to location_reviews_url, notice: 'Location review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_review
      @location_review = LocationReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_review_params
      params.require(:location_review).permit(:profile_id, :location_id, :review, :rating)
    end
end
