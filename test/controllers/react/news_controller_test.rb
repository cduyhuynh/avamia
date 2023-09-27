require "test_helper"

class React::NewsControllerTest < ActionDispatch::IntegrationTest
  test "should return a list of news" do
    get react_news_index_url, params: { page: 1 }

    response_body = JSON.parse @response.body
    assert_response :success
    assert_equal(news.length, response_body["items"].count)
  end
end
