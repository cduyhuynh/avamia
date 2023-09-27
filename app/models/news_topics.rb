class NewsTopics < ApplicationRecord
  belongs_to :news
  belongs_to :topic
end
