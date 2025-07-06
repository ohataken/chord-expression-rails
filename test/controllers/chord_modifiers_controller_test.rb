require "test_helper"

class ChordModifiersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chord_modifiers_url
    assert_response :success
  end

  test "should get show" do
    get chord_modifier_url("mmaj7")
    assert_response :success
  end
end
