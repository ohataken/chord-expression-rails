require "test_helper"

class ChordModifiersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chord_modifiers_index_url
    assert_response :success
  end

  test "should get show" do
    get chord_modifiers_show_url
    assert_response :success
  end
end
