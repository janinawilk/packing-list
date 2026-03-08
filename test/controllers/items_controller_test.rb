require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:tshirt)
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    get new_item_url
    assert_response :success
  end

  test "should create item" do
    assert_difference("Item.count") do
      post items_url, params: { item: { name: "Jacket", category_id: categories(:clothing).id } }
    end
    assert_redirected_to items_path
  end

  test "should create item with tags" do
    assert_difference("Item.count") do
      post items_url, params: { item: {
        name: "Jacket",
        category_id: categories(:clothing).id,
        tag_ids: [tags(:winter).id, tags(:hiking).id]
      } }
    end
    item = Item.last
    assert_equal 2, item.tags.count
  end

  test "should not create invalid item" do
    assert_no_difference("Item.count") do
      post items_url, params: { item: { name: "", category_id: "" } }
    end
    assert_response :unprocessable_entity
  end

  test "should get edit" do
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: { name: "Updated" } }
    assert_redirected_to items_path
    assert_equal "Updated", @item.reload.name
  end

  test "should update item tags" do
    patch item_url(@item), params: { item: { tag_ids: [tags(:winter).id] } }
    assert_equal [tags(:winter)], @item.reload.tags
  end

  test "should destroy item" do
    assert_difference("Item.count", -1) do
      delete item_url(@item)
    end
    assert_redirected_to items_path
  end
end
