module UnitConvertible
  extend ActiveSupport::Concern

  def to_milligram
    Unitwise(amount, unit.name.strip.downcase).to_milligram.to_f
  end

  module ClassMethods
    def to_milligram
      self.includes(:unit).where("amount > 0").where(amount_mg: nil).each do |model|
        model.update_column :amount_mg, model.to_milligram
      end
    end
  end
end
