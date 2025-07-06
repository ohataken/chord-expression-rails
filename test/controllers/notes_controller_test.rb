require "test_helper"

class NotesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get notes_url
    assert_response :success
  end

  test "should get show" do
    get note_url("A")
    assert_response :success
  end
end
