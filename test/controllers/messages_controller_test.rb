require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get messages_url  # ✅ 正しいヘルパー
    assert_response :success
  end

  test "should create message" do
    post messages_url, params: { message: { content: "Hello" } }  # ✅ POST + パラメータ
    assert_response :redirect  # createはredirect_to root_pathしてるのでこれでOK
  end
end
