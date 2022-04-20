require "test_helper"

class Public::CorporatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_corporates_index_url
    assert_response :success
  end

  test "should get show" do
    get public_corporates_show_url
    assert_response :success
  end
end
