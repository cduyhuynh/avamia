class NewsFetchingService < FetchingService
  def get_news
    news_url = url + "&time_from=#{time_from}"
    data = fetch_data news_url
    raise data["Information"] if data["feed"].nil?

    serialized_items(data['feed'])
  end

  def get_news_by_tickers tickers
    news_url = url + "&tickers=#{tickers}"
    data = fetch_data news_url
    raise data["Information"] if data["feed"].nil?

    serialized_items(data['feed'])
  end

  private
  def function
    "NEWS_SENTIMENT"
  end

  def time_from
    latest_news = News.order(published_at: :desc).first
    latest_news.nil? ? '' : (latest_news.published_at + 1.minute).strftime("%Y%m%dT%H%M")
  end

  def serialized_items items
    data = []
    items.each do |item|
      tmp = {}
      tmp[:title] = item["title"]
      tmp[:summary] = item["summary"]
      tmp[:original_url] = item["url"]
      tmp[:image_url] = item["banner_image"]
      tmp[:published_at] = DateTime.parse item["time_published"]
      tmp[:topics] = item["topics"]
      tmp[:tickers] = item["ticker_sentiment"]
      data << tmp
    end
    data
  end

end