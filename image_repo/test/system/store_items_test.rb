require "application_system_test_case"

class StoreItemsTest < ApplicationSystemTestCase
  setup do
    @store_item = store_items(:one)
  end

  test "visiting the index" do
    visit store_items_url
    assert_selector "h1", text: "Store Items"
  end

  test "creating a Store item" do
    visit store_items_url
    click_on "New Store Item"

    click_on "Create Store item"

    assert_text "Store item was successfully created"
    click_on "Back"
  end

  test "updating a Store item" do
    visit store_items_url
    click_on "Edit", match: :first

    click_on "Update Store item"

    assert_text "Store item was successfully updated"
    click_on "Back"
  end

  test "destroying a Store item" do
    visit store_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Store item was successfully destroyed"
  end
end
