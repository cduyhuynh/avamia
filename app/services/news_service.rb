class NewsService
  def list
    if should_fetch?
      items = fetching_service.get_news
      redis.set('latest_fetch', DateTime.now.to_i)
      redis.set('latest_news', items.to_json)
    else
      items = JSON.parse redis.get('latest_news')
    end
    serialize_items items
  end

  def list_by_tickers tickers_param
    tickers = tickers_param.join(',')
    items = fetching_service.get_news_by_tickers tickers
    serialize_items items
  end

  private
  def fetching_service
    @fetching_service ||= NewsFetchingService.new
  end

  def redis
    @redis ||= Redis.new
  end

  def should_fetch?
    current = DateTime.now.to_i
    latest_fetch = redis.get('latest_fetch').to_i
    (current - latest_fetch) > 300
  end

  def serialize_items items
    topic_name_code_hash = Topic.pluck(:name, :code).to_h
    items.each do |item|
      item["published_at"] = DateTime.parse(item["time_published"]).strftime '%m/%d/%Y %H:%M'
      item["topics"] = item["topics"].map{|topic| [topic_name_code_hash[topic["topic"]], topic["topic"]]}
      item["tickers"] = item["ticker_sentiment"].map{|ticker| [ticker["ticker"], ticker["ticker_sentiment_label"]]}
    end
  end
end