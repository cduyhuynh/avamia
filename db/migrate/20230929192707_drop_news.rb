class DropNews < ActiveRecord::Migration[7.0]
  def change
    drop_table :news
    drop_table :news_topics
    drop_table :news_tickers
  end
end
