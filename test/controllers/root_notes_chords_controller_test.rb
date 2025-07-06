require "test_helper"

class RootNotesChordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_notes_chords_index_url
    assert_response :success
  end

  test "should get show" do
    get root_notes_chords_show_url
    assert_response :success
  end
end
