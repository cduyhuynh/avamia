class TickerService < FetchingService
  def search keywords
    tickers = fetching_service.search keywords
    serialize_tickers tickers
  end

  private
  def fetching_service
    @fetching_service ||= TickerFetchingService.new
  end

  def serialize_tickers tickers
    data = []
    tickers.each do |ticker|
      label = "#{ticker["1. symbol"]} (#{ticker["2. name"]})"
      data << {value: ticker["1. symbol"], label: label}
    end
    data
  end
end