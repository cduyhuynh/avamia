class FetchingService
  def fetch_data url
    uri = URI url
    req = Net::HTTP::Get.new uri
    response = Net::HTTP.start(uri.hostname, use_ssl: true, open_timeout: 5) {|http|
       http.request(req)
    }
    raise "Can not connect to data site" unless response.code.to_i == 200
    JSON.parse(response.body)
  end

  def url
    base_url + "?function=#{function}&apikey=#{api_key}"
  end

  def base_url
    "https://www.alphavantage.co/query"
  end

  def api_key
    ENV['ALPHA_VANTAGE_API_KEY']
  end
end