require "test_helper"

class ChordModifiersChordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chord_modifiers_chords_index_url
    assert_response :success
  end

  test "should get show" do
    get chord_modifiers_chords_show_url
    assert_response :success
  end
end
