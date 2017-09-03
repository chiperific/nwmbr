require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::ControllerHelpers

  setup do
    @user = user(:one)
  end

  test "should get manage" do
    get users_manage_url
    assert_response :success
  end

  test "should get flag" do
    get users_flag_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post user_url, params: { user_track: { role: @user_track.role, user_id: @user_track.user_id } }
    end

    assert_redirected_to user_track_url(UserTrack.last)
  end

end
