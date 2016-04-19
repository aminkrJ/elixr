require 'spec_helper'

shared_examples "unit_convertible" do
  let(:model) { described_class }

  describe "to_miligram" do
    it "units are not convertible" do
      expect(create(model.to_s.underscore.to_sym).to_milligram).to eq(10500.0)
    end
  end
end
