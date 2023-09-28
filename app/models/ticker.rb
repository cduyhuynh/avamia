class Ticker < ApplicationRecord
  has_many :news_tickers, class_name: "NewsTickers", dependent: :destroy
  has_many :news, through: :news_tickers

  def self.symbol_hash
    pluck(:symbol, :id).to_h
  end
end
