require 'test_helper'

class BadgesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get badges_new_url
    assert_response :success
  end

  test "should get create" do
    get badges_create_url
    assert_response :success
  end

end
