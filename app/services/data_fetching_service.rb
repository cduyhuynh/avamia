class DataFetchingService
  def get_news
    tickers = ''
    url = news_url tickers
    serialized_items(get_data(url))
  end

  private
  def get_data url
    uri = URI url
    req = Net::HTTP::Get.new uri
    response = Net::HTTP.start(uri.hostname, use_ssl: true, open_timeout: 5) {|http|
       http.request(req)
    }
    raise "Can not connect to data site" unless response.code.to_i == 200
    reponse_body = JSON.parse(response.body)
    reponse_body["feed"]
  end

  def news_url tickers
    base_url + "?function=NEWS_SENTIMENT&tickers=#{tickers}&apikey=#{api_key}&time_from=#{time_from}"
  end

  def time_from
    latest_news = News.order(:published_at).first
    latest_news.nil? ? '' : latest_news.published_at.strftime("%Y%m%dT%H%M")
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
      data << tmp
    end
    data
  end

  def base_url
    "https://www.alphavantage.co/query"
  end

  def api_key
    ENV['ALPHA_VANTAGE_API_KEY']
  end
end