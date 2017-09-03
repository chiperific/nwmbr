require 'test_helper'

class BiblesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get bibles_home_url
    assert_response :success
  end

end
