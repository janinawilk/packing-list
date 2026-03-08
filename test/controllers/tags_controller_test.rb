require "test_helper"

class TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag = tags(:beach)
  end

  test "should get index" do
    get tags_url
    assert_response :success
  end

  test "should get new" do
    get new_tag_url
    assert_response :success
  end

  test "should create tag" do
    assert_difference("Tag.count") do
      post tags_url, params: { tag: { name: "Formal" } }
    end
    assert_redirected_to tags_path
  end

  test "should not create invalid tag" do
    assert_no_difference("Tag.count") do
      post tags_url, params: { tag: { name: "" } }
    end
    assert_response :unprocessable_entity
  end

  test "should get edit" do
    get edit_tag_url(@tag)
    assert_response :success
  end

  test "should update tag" do
    patch tag_url(@tag), params: { tag: { name: "Updated" } }
    assert_redirected_to tags_path
    assert_equal "Updated", @tag.reload.name
  end

  test "should destroy tag" do
    assert_difference("Tag.count", -1) do
      delete tag_url(@tag)
    end
    assert_redirected_to tags_path
  end
end
