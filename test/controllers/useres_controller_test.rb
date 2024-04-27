require "test_helper"

class UseresControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get useres_show_url
    assert_response :success
  end

  test "should get edit" do
    get useres_edit_url
    assert_response :success
  end

  test "should get index" do
    get useres_index_url
    assert_response :success
  end
end
