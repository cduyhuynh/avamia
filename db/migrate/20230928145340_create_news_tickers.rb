class CreateNewsTickers < ActiveRecord::Migration[7.0]
  def change
    create_table :news_tickers do |t|
      t.references :news
      t.references :ticker
      t.string :sentiment_label
      t.timestamps
    end
  end
end
