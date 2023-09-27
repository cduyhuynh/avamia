class Topic < ApplicationRecord
  belongs_to :news
  def self.name_hash
    pluck(:name, :id).to_h
  end
end
