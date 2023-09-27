class NewsService
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
end