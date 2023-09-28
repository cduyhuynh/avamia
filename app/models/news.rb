class News < ApplicationRecord
  has_many :news_topics, class_name: "NewsTopics", dependent: :destroy
  has_many :topics, through: :news_topics
  has_many :news_tickers, class_name: "NewsTickers", dependent: :destroy
  has_many :tickers, through: :news_tickers
end
