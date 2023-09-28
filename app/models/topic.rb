class Topic < ApplicationRecord
  def self.name_hash
    pluck(:name, :id).to_h
  end
end
