require "test_helper"

class Public::MyCharactersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_my_characters_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_my_characters_edit_url
    assert_response :success
  end
end
