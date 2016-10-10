require 'test_helper'

class LocationListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location_list = location_lists(:one)
  end

  test "should get index" do
    get location_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_location_list_url
    assert_response :success
  end

  test "should create location_list" do
    assert_difference('LocationList.count') do
      post location_lists_url, params: { location_list: { profile_id: @location_list.profile_id } }
    end

    assert_redirected_to location_list_url(LocationList.last)
  end

  test "should show location_list" do
    get location_list_url(@location_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_list_url(@location_list)
    assert_response :success
  end

  test "should update location_list" do
    patch location_list_url(@location_list), params: { location_list: { profile_id: @location_list.profile_id } }
    assert_redirected_to location_list_url(@location_list)
  end

  test "should destroy location_list" do
    assert_difference('LocationList.count', -1) do
      delete location_list_url(@location_list)
    end

    assert_redirected_to location_lists_url
  end
end
