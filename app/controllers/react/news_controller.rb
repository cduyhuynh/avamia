class React::NewsController < ApplicationController
  def index
    items = service.list params[:page].to_i
    render json: { items: items }, status: :ok
  end

  def search_by_tickers
    items = service.list_by_tickers params[:tickers]
    render json: { items: items }, status: :ok
  end

  private
  def service
    @service ||= NewsService.new
  end
end
