class News < ApplicationRecord
  has_many :news_topics, class_name: "NewsTopics", dependent: :destroy
  has_many :topics, through: :news_topics
end
