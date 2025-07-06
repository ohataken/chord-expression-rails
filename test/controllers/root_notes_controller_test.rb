require "test_helper"

class RootNotesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_notes_index_url
    assert_response :success
  end
end
