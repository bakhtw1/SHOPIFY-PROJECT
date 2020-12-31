require "test_helper"

class StoreItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_item = store_items(:one)
  end

  test "should get index" do
    get store_items_url
    assert_response :success
  end

  test "should get new" do
    get new_store_item_url
    assert_response :success
  end

  test "should create store_item" do
    assert_difference('StoreItem.count') do
      post store_items_url, params: { store_item: {  } }
    end

    assert_redirected_to store_item_url(StoreItem.last)
  end

  test "should show store_item" do
    get store_item_url(@store_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_store_item_url(@store_item)
    assert_response :success
  end

  test "should update store_item" do
    patch store_item_url(@store_item), params: { store_item: {  } }
    assert_redirected_to store_item_url(@store_item)
  end

  test "should destroy store_item" do
    assert_difference('StoreItem.count', -1) do
      delete store_item_url(@store_item)
    end

    assert_redirected_to store_items_url
  end
end
