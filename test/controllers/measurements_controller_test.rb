require "test_helper"

class MeasurementsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get measurements_new_url
    assert_response :success
  end
end
