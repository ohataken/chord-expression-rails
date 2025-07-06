require "test_helper"

class ChordModifiersChordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chord_modifier_chord_modifiers_chords_url("mmaj7")
    assert_response :success
  end

  test "should get show" do
    get chord_modifier_chord_modifiers_chord_url("mmaj7", "Ammaj7")
    assert_response :success
  end
end
