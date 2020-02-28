require "application_system_test_case"

class WishItemsTest < ApplicationSystemTestCase
  setup do
    @wish_item = wish_items(:one)
  end

  test "visiting the index" do
    visit wish_items_url
    assert_selector "h1", text: "Wish Items"
  end

  test "creating a Wish item" do
    visit wish_items_url
    click_on "New Wish Item"

    fill_in "Item", with: @wish_item.item_id
    fill_in "Wishlist", with: @wish_item.wishlist_id
    click_on "Create Wish item"

    assert_text "Wish item was successfully created"
    click_on "Back"
  end

  test "updating a Wish item" do
    visit wish_items_url
    click_on "Edit", match: :first

    fill_in "Item", with: @wish_item.item_id
    fill_in "Wishlist", with: @wish_item.wishlist_id
    click_on "Update Wish item"

    assert_text "Wish item was successfully updated"
    click_on "Back"
  end

  test "destroying a Wish item" do
    visit wish_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Wish item was successfully destroyed"
  end
end
