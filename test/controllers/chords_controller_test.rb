require "test_helper"

class ChordsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get chords_show_url
    assert_response :success
  end
end
