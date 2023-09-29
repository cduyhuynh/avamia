require "test_helper"

class React::TickersControllerTest < ActionDispatch::IntegrationTest
  test "should return a list of tickers" do
    get search_react_tickers_url, params: { term: 'SAI' }

    response_body = JSON.parse @response.body
    assert_response :success
  end
end
