require "test_helper"

class ScalesChordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scale_scales_chords_url("Amaj")
    assert_response :success
  end
end
