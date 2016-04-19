module UnitConvertible
  extend ActiveSupport::Concern

  def to_milligram
    Unitwise(amount, unit.name.strip.downcase).to_milligram.to_f
  end

  module ClassMethods
    def to_milligram
      self.joins(:unit).where("amount > 0").where(amount_mg: nil).each do |model|
        begin
         model.update_column :amount_mg, model.to_milligram
        rescue Unitwise::ConversionError => e
          puts "#{model.id}: #{e.to_s}"
          next
        rescue Unitwise::ExpressionError => e
          puts "#{model.id}: #{e.to_s}"
          next
        end
      end
    end
  end
end
