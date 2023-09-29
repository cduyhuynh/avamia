class Ticker < ApplicationRecord

  def self.symbol_hash
    pluck(:symbol, :id).to_h
  end
end
