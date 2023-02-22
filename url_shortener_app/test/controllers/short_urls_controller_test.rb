require "test_helper"

class ShortUrlsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get short_urls_show_url
    assert_response :success
  end
end
