class NewsFetchingService < FetchingService
  def get_news
    data = fetch_data url
    raise data["Information"] if data["feed"].nil?

    data['feed']
  end

  def get_news_by_tickers tickers
    news_url = url + "&tickers=#{tickers}"
    data = fetch_data news_url
    raise data["Information"] if data["feed"].nil?

    data['feed']
  end

  private
  def function
    "NEWS_SENTIMENT"
  end

end