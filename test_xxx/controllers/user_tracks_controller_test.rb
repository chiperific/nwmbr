require 'test_helper'

class UserTracksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::ControllerHelpers

  setup do
    @user_track = user_tracks(:one)
  end

  test "should get index" do
    get user_tracks_url
    assert_response :success
  end

  test "should get new" do
    get new_user_track_url
    assert_response :success
  end

  test "should create user_track" do
    assert_difference('UserTrack.count') do
      post user_tracks_url, params: { user_track: { role: @user_track.role, user_id: @user_track.user_id } }
    end

    assert_redirected_to user_track_url(UserTrack.last)
  end

  test "should show user_track" do
    get user_track_url(@user_track)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_track_url(@user_track)
    assert_response :success
  end

  test "should update user_track" do
    patch user_track_url(@user_track), params: { user_track: { role: @user_track.role, user_id: @user_track.user_id } }
    assert_redirected_to user_track_url(@user_track)
  end

  test "should destroy user_track" do
    assert_difference('UserTrack.count', -1) do
      delete user_track_url(@user_track)
    end

    assert_redirected_to user_tracks_url
  end
end
