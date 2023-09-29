class TickerFetchingService < FetchingService
  def search keywords
    search_url = url + "&keywords=#{keywords}"
    tickers = fetch_data search_url
    p tickers
    tickers["bestMatches"]
  end

  private
  def function
    "SYMBOL_SEARCH"
  end

  def api_key
    ENV["TICKER_API_KEY"]
  end
end