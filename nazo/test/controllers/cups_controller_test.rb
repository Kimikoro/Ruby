require 'test_helper'

class CupsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get cups_top_url
    assert_response :success
  end

  test "should get new" do
    get cups_new_url
    assert_response :success
  end

  test "should get index" do
    get cups_index_url
    assert_response :success
  end

  test "should get show" do
    get cups_show_url
    assert_response :success
  end

  test "should get edit" do
    get cups_edit_url
    assert_response :success
  end

end
