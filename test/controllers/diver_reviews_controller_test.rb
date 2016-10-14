require 'test_helper'

class DiverReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @diver_review = diver_reviews(:one)
  end

  test "should get index" do
    get diver_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_diver_review_url
    assert_response :success
  end

  test "should create diver_review" do
    assert_difference('DiverReview.count') do
      post diver_reviews_url, params: { diver_review: { diver_rating: @diver_review.diver_rating, diver_review: @diver_review.diver_review, profile_id: @diver_review.profile_id } }
    end

    assert_redirected_to diver_review_url(DiverReview.last)
  end

  test "should show diver_review" do
    get diver_review_url(@diver_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_diver_review_url(@diver_review)
    assert_response :success
  end

  test "should update diver_review" do
    patch diver_review_url(@diver_review), params: { diver_review: { diver_rating: @diver_review.diver_rating, diver_review: @diver_review.diver_review, profile_id: @diver_review.profile_id } }
    assert_redirected_to diver_review_url(@diver_review)
  end

  test "should destroy diver_review" do
    assert_difference('DiverReview.count', -1) do
      delete diver_review_url(@diver_review)
    end

    assert_redirected_to diver_reviews_url
  end
end
