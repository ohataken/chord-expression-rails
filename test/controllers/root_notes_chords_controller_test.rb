require "test_helper"

class RootNotesChordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_note_root_notes_chords_url("A")
    assert_response :success
  end
end
