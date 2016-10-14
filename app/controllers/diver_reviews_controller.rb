class DiverReviewsController < ApplicationController
  before_action :set_diver_review, only: [:show, :edit, :update, :destroy]

  # GET /diver_reviews
  # GET /diver_reviews.json
  def index
    @diver_reviews = DiverReview.all
  end

  # GET /diver_reviews/1
  # GET /diver_reviews/1.json
  def show
  end

  # GET /diver_reviews/new
  def new
    @diver_review = DiverReview.new
  end

  # GET /diver_reviews/1/edit
  def edit
  end

  # POST /diver_reviews
  # POST /diver_reviews.json
  def create
    @diver_review = DiverReview.new(diver_review_params)

    respond_to do |format|
      if @diver_review.save
        format.html { redirect_to @diver_review, notice: 'Diver review was successfully created.' }
        format.json { render :show, status: :created, location: @diver_review }
      else
        format.html { render :new }
        format.json { render json: @diver_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diver_reviews/1
  # PATCH/PUT /diver_reviews/1.json
  def update
    respond_to do |format|
      if @diver_review.update(diver_review_params)
        format.html { redirect_to @diver_review, notice: 'Diver review was successfully updated.' }
        format.json { render :show, status: :ok, location: @diver_review }
      else
        format.html { render :edit }
        format.json { render json: @diver_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diver_reviews/1
  # DELETE /diver_reviews/1.json
  def destroy
    @diver_review.destroy
    respond_to do |format|
      format.html { redirect_to diver_reviews_url, notice: 'Diver review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diver_review
      @diver_review = DiverReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diver_review_params
      params.require(:diver_review).permit(:profile_id, :diver_review, :diver_rating)
    end
end
