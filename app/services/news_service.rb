class NewsService
  def list current_page
    offset = (current_page - 1)*limit
    items = News.preload(:topics, :tickers).
              order(published_at: :desc).
              offset(offset).
              limit(limit)
    serialize_items items
  end

  def list_by_tickers tickers_param
    tickers = tickers_param.join(',')
    items = data_service.get_news_by_tickers tickers
    serialize_tickers_items items
  end

  def store_items
    items = data_service.get_news
    items.sort_by! {|item| item[:published_at]}
    topic_name_hash = Topic.name_hash
    ticker_symbol_hash = Ticker.symbol_hash
    news_topics_records = []
    news_tickers_records = []

    items.each do |item|
      news = News.create! item.except(:topics, :tickers)
      item[:topics].each do |topic|
        news_topics_records << {news_id: news.id, topic_id: topic_name_hash[topic["topic"]], relevance_score: topic["relevance_score"]}
      end

      item[:tickers].each do |ticker|
        ticker_symbol = ticker["ticker"]
        if ticker_symbol_hash[ticker_symbol].nil?
          ticker_id = Ticker.create!(symbol: ticker_symbol).id
          ticker_symbol_hash[ticker_symbol] = ticker_id
        else
          ticker_id = ticker_symbol_hash[ticker_symbol]  
        end
        news_tickers_records << {news_id: news.id, ticker_id: ticker_id, sentiment_label: ticker["ticker_sentiment_label"]}
      end
    end
    NewsTopics.insert_all news_topics_records
    NewsTickers.insert_all news_tickers_records
  end

  private
  def data_service
    @data_service ||= DataFetchingService.new
  end

  def limit
    25
  end

  def serialize_items items
    data = []
    items.each do |item|
      tmp = item.as_json
      tmp[:published_at] = item.published_at.strftime '%m/%d/%Y %H:%M'
      tmp[:topics] = item.topics.pluck(:code, :name)
      tmp[:tickers] = item.tickers.pluck(:symbol, :sentiment_label)
      data << tmp
    end
    data
  end

  def serialize_tickers_items items
    topic_name_code_hash = Topic.pluck(:name, :code).to_h
    items.each do |item|
      item[:published_at] = item[:published_at].strftime '%m/%d/%Y %H:%M'
      item[:topics] = item[:topics].map{|topic| [topic_name_code_hash[topic["topic"]], topic["topic"]]}
      item[:tickers] = item[:tickers].nil? ? [] : item[:tickers].map{|ticker| [ticker["ticker"], ticker["ticker_sentiment_label"]]}
    end
  end
end