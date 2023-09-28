class NewsTickers < ApplicationRecord
  belongs_to :news
  belongs_to :ticker
  validates :sentiment_label, inclusion: { in: %w(Bearish Somewhat-Bearish Neutral Somewhat-Bullish Bullish) }
end
