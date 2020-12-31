require "application_system_test_case"

class UserItemsTest < ApplicationSystemTestCase
  setup do
    @user_item = user_items(:one)
  end

  test "visiting the index" do
    visit user_items_url
    assert_selector "h1", text: "User Items"
  end

  test "creating a User item" do
    visit user_items_url
    click_on "New User Item"

    click_on "Create User item"

    assert_text "User item was successfully created"
    click_on "Back"
  end

  test "updating a User item" do
    visit user_items_url
    click_on "Edit", match: :first

    click_on "Update User item"

    assert_text "User item was successfully updated"
    click_on "Back"
  end

  test "destroying a User item" do
    visit user_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User item was successfully destroyed"
  end
end
