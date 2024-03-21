require "test_helper"

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_edit_url
    assert_response :success
  end

  test "should get create" do
    get admins_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_destroy_url
    assert_response :success
  end
end
