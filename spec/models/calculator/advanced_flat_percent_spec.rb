require File.dirname(__FILE__) + '/../../spec_helper'

describe 'Spree::Calculator::AdvancedFlatPercent based on master_price' do
  let(:calculator) { Spree::Calculator::AdvancedFlatPercent.new }
  let(:order) { FactoryGirl.create(:order, 
    :line_items => [
      FactoryGirl.build(:line_item, :price => 10, :quantity => 1), 
      FactoryGirl.build(:line_item, :price => 20, :quantity => 1)
    ]
  )}

  before do
    allow(calculator).to receive(:preferred_flat_percent).and_return(10)
    allow(calculator).to receive(:preferred_based_on_cost_price).and_return(false)
  end

  context "compute" do
    it "should compute amount correctly" do
      expect(calculator.compute(order)).to eq(-3.0)
    end

    it "should round result correctly" do
      allow(order).to receive(:line_items).and_return([
        FactoryGirl.create(:line_item, :price => 10.56, :quantity => 1), 
        FactoryGirl.create(:line_item, :price => 20.49, :quantity => 1)
      ])
      expect(calculator.compute(order)).to eq(-3.11)

      allow(order).to receive(:line_items).and_return([
        FactoryGirl.create(:line_item, :price => 10.56, :quantity => 1), 
        FactoryGirl.create(:line_item, :price => 20.48, :quantity => 1)])
      expect(calculator.compute(order)).to eq(-3.10)
    end
  end
end


describe 'Spree::Calculator::AdvancedFlatPercent based on cost_price' do
  let(:calculator) { Spree::Calculator::AdvancedFlatPercent.new }
  let(:variant1) { FactoryGirl.create(:variant, :cost_price => 3, :price => 5) }
  let(:variant2) { FactoryGirl.create(:variant, :cost_price => 12, :price => 20) }
  let(:order) { FactoryGirl.create(:order,
    :line_items => [
      FactoryGirl.create(:line_item, :price => 5, :quantity => 2, :variant => variant1), 
      FactoryGirl.create(:line_item, :price => 20, :quantity => 1, :variant => variant2)
    ]
  )}

  before do
    allow(calculator).to receive(:preferred_flat_percent).and_return(15)
    allow(calculator).to receive(:preferred_based_on_cost_price).and_return(true)
  end

  context "compute" do
    it "should compute amount correctly" do
      expect(calculator.compute(order)).to eq(BigDecimal.new("-9.30"))
    end

    it "should round result correctly" do
      allow(variant1).to receive(:cost_price).and_return(2.7)
      allow(variant2).to receive(:cost_price).and_return(12.35)
      expect(calculator.compute(order)).to eq(BigDecimal.new("-9.59")) # -9.5875
      
      allow(variant1).to receive(:cost_price).and_return(2.7)
      allow(variant2).to receive(:cost_price).and_return(12.25) 
      expect(calculator.compute(order)).to eq(BigDecimal.new("-9.70")) # -9.7025
    end
  end

  context "compute_item" do
    it "should compute price correctly" do
      expect(calculator.compute_item(variant1)).to eq(3*1.15)
      allow(variant1).to receive(:cost_price).and_return(2.7)
      expect(calculator.compute_item(variant1)).to eq(2.7*1.15)
      allow(variant1).to receive(:cost_price).and_return(nil)
      expect(calculator.compute_item(variant1)).to eq(5)
    end
  end
end
