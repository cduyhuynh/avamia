class React::NewsController < ApplicationController
  def index
    items = service.list
    render json: { items: items }, status: :ok
  end

  def search_by_tickers
    begin
      items = service.list_by_tickers params[:tickers]
      render json: { items: items }, status: :ok
    rescue => e
      render json: { message: e }, status: 422
    end
  end

  private
  def service
    @service ||= NewsService.new
  end
end
