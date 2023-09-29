class React::TickersController < ApplicationController
  def search
    tickers = service.search params[:term]
    render json: { tickers: tickers }, status: :ok
  end

  private
  def service
    @service ||= TickerService.new
  end
end
