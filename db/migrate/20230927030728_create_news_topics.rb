class CreateNewsTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :news_topics do |t|
      t.references :news
      t.references :topic
      t.decimal :relevance_score, precision: 3, scale: 2
      t.timestamps
    end
  end
end
