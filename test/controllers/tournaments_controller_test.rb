require 'test_helper'

class TournamentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tournaments_new_url
    assert_response :success
  end

  test "should get edit" do
    get tournaments_edit_url
    assert_response :success
  end

  test "should get show" do
    get tournaments_show_url
    assert_response :success
  end

end
