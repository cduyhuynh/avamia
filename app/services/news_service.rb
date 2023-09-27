class NewsService
  def list current_page
    offset = (current_page - 1)*limit
    News.order(published_at: :desc).
      offset(offset).
      limit(limit)
  end

  def store_items
    items = data_service.get_news
    items.sort_by! {|item| item[:published_at]}
    topic_name_hash = Topic.name_hash
    news_topics_records = []

    items.each do |item|
      news = News.create item.except(:topics)
      item[:topics].each do |topic|
        news_topics_records << {news_id: news.id, topic_id: topic_name_hash[topic["topic"]], relevance_score: topic["relevance_score"]}
      end
    end
    NewsTopics.insert_all news_topics_records
  end

  private
  def data_service
    @data_service ||= DataFetchingService.new
  end

  def limit
    10
  end
end