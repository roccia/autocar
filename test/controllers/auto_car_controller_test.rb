require 'test_helper'

class AutoCarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get auto_car_index_url
    assert_response :success
  end

end
