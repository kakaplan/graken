require "test_helper"

class StationMapsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get station_maps_index_url
    assert_response :success
  end

  test "should get new" do
    get station_maps_new_url
    assert_response :success
  end

  test "should get edit" do
    get station_maps_edit_url
    assert_response :success
  end
end
