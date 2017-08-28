require "application_system_test_case"

class UserTracksTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit user_tracks_url

    assert_selector "h1", text: "UserTrack"
  end
end
