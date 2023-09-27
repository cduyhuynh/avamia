class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :summary
      t.string :original_url
      t.string :image_url
      t.timestamp :published_at

      t.timestamps
    end
  end
end
