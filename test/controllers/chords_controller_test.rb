require "test_helper"

class ChordsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get chord_url("Ammaj7")
    assert_response :success
  end
end
