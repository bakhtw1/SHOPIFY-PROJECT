require "test_helper"

class UserItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_item = user_items(:one)
  end

  test "should get index" do
    get user_items_url
    assert_response :success
  end

  test "should get new" do
    get new_user_item_url
    assert_response :success
  end

  test "should create user_item" do
    assert_difference('UserItem.count') do
      post user_items_url, params: { user_item: {  } }
    end

    assert_redirected_to user_item_url(UserItem.last)
  end

  test "should show user_item" do
    get user_item_url(@user_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_item_url(@user_item)
    assert_response :success
  end

  test "should update user_item" do
    patch user_item_url(@user_item), params: { user_item: {  } }
    assert_redirected_to user_item_url(@user_item)
  end

  test "should destroy user_item" do
    assert_difference('UserItem.count', -1) do
      delete user_item_url(@user_item)
    end

    assert_redirected_to user_items_url
  end
end
