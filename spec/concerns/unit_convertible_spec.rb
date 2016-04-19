require 'spec_helper'

shared_examples "unit_convertible" do
  let(:described_symbol) { described_class.to_s.underscore.to_sym }
  let(:kilojoule) { create :unit, name: 'kilojoule', symbol: 'kj' }
  let(:invalid_unit) { create :unit, name: 'invalid_unit', symbol: 'w' }

  describe "#to_milligram" do
    it "is convertible unit" do
      expect{ create(described_symbol).to_milligram }.not_to raise_error
    end

    it "is not convertible unit" do
      expect{ create(described_symbol, unit: kilojoule).to_milligram }.to raise_error(Unitwise::ConversionError)
    end

    it "is wrong unit" do
      expect{ create(described_symbol, unit: invalid_unit).to_milligram }.to raise_error(Unitwise::ExpressionError)
    end
  end

  describe ".to_milligram" do
    before(:each) do
      @ingredient_nutrition_fact_1 = create described_symbol
      @ingredient_nutrition_fact_2 = create described_symbol, unit: kilojoule
      @ingredient_nutrition_fact_3 = create described_symbol, unit: invalid_unit
      @ingredient_nutrition_fact_4 = create described_symbol
    end

    it "updates amount_mg for valid ingredient_nutritoin_facts" do
      described_class.to_milligram
      expect(@ingredient_nutrition_fact_1.reload.amount_mg).to eq(10500)
      expect(@ingredient_nutrition_fact_2.reload.amount_mg).to be_nil
      expect(@ingredient_nutrition_fact_3.reload.amount_mg).to be_nil
      expect(@ingredient_nutrition_fact_4.reload.amount_mg).to eq(10500)
    end
  end
end
