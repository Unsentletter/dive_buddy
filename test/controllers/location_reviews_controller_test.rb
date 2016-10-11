require 'test_helper'

class LocationReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location_review = location_reviews(:one)
  end

  test "should get index" do
    get location_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_location_review_url
    assert_response :success
  end

  test "should create location_review" do
    assert_difference('LocationReview.count') do
      post location_reviews_url, params: { location_review: { location_id: @location_review.location_id, profile_id: @location_review.profile_id, rating: @location_review.rating, review: @location_review.review } }
    end

    assert_redirected_to location_review_url(LocationReview.last)
  end

  test "should show location_review" do
    get location_review_url(@location_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_review_url(@location_review)
    assert_response :success
  end

  test "should update location_review" do
    patch location_review_url(@location_review), params: { location_review: { location_id: @location_review.location_id, profile_id: @location_review.profile_id, rating: @location_review.rating, review: @location_review.review } }
    assert_redirected_to location_review_url(@location_review)
  end

  test "should destroy location_review" do
    assert_difference('LocationReview.count', -1) do
      delete location_review_url(@location_review)
    end

    assert_redirected_to location_reviews_url
  end
end
