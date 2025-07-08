require "test_helper"

class ChordModifiersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chord_modifiers_url
    assert_response :success
  end
end
