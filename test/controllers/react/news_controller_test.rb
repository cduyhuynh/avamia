require "test_helper"

class React::NewsControllerTest < ActionDispatch::IntegrationTest
  test "should return a list of news items" do
    get react_news_url, params: { page: 1 }

    response_body = JSON.parse @response.body
    assert_response :success
  end

  test "should return a list of news items with topics" do
    get react_news_url, params: { page: 1 }

    response_body = JSON.parse @response.body
    assert_response :success
  end

  test "should return a list of news items with tickers" do
    get react_news_url, params: { page: 1 }

    response_body = JSON.parse @response.body
    assert_response :success
  end

  test "should return a list of news items by tickers" do
    get search_by_tickers_react_news_url, params: { tickers: ['ODFL'] }

    response_body = JSON.parse @response.body
    assert_response :success
  end
end
