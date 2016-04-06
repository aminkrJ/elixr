class Unit < ActiveRecord::Base
  def self.find_by_name_or_symbol(name_or_symbol)
    Unit.where("symbol = :name_or_symbol OR name = :name_or_symbol", name_or_symbol: name_or_symbol.singularize).first
  end
end
