require "test_helper"

class RentControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get rent_create_url
    assert_response :success
  end

  test "should get update" do
    get rent_update_url
    assert_response :success
  end
end
