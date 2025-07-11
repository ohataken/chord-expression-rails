require "test_helper"

class ScalesChordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scales_chords_index_url
    assert_response :success
  end
end
