require File.dirname(__FILE__) + '/../../spec_helper'

describe 'Calculator::AdvancedFlatPercent based on master_price' do
  let(:calculator) { Calculator::AdvancedFlatPercent.new }
  let(:order) { mock_model Order, :line_items => [mock_model(LineItem, :amount => 10), mock_model(LineItem, :amount => 20)], :user => mock_model(User) }

  before { calculator.stub :preferred_flat_percent => 10, :preferred_based_on_cost_price => false }

  context "compute" do
    it "should compute amount correctly" do
      calculator.compute(order).should == -3.0
    end

    it "should round result correctly" do
      order.stub :line_items => [mock_model(LineItem, :amount => 10.56), mock_model(LineItem, :amount => 20.49)]
      calculator.compute(order).should == -3.11

      order.stub :line_items => [mock_model(LineItem, :amount => 10.56), mock_model(LineItem, :amount => 20.48)]
      calculator.compute(order).should == -3.10
    end
  end
end


describe 'Calculator::AdvancedFlatPercent based on cost_price' do
  let(:calculator) { Calculator::AdvancedFlatPercent.new }
  let(:variant1) { mock_model(Variant, :cost_price => 3, :price => 5) }
  let(:variant2) { mock_model(Variant, :cost_price => 12, :price => 20) }
  let(:order) { mock_model Order, :line_items => [mock_model(LineItem, :amount => 10, :quantity => 2, :variant => variant1), mock_model(LineItem, :amount => 20, :quantity => 1, :variant => variant2)], :user => mock_model(User) }

  before { calculator.stub :preferred_flat_percent => 15, :preferred_based_on_cost_price => true }

  context "compute" do
    it "should compute amount correctly" do
      calculator.compute(order).should == -9.3
    end

    it "should round result correctly" do
      variant1.stub :cost_price => 2.7
      variant2.stub :cost_price => 12.35
      calculator.compute(order).should == -9.59 # -9.5875
      
      variant1.stub :cost_price => 2.7
      variant2.stub :cost_price => 12.25     
      calculator.compute(order).should == -9.70 # -9.7025
    end
  end

  context "compute_item" do
    it "should compute price correctly" do
      calculator.compute_item(variant1).should == 3*1.15
      variant1.stub :cost_price => 2.7
      calculator.compute_item(variant1).should == 2.7*1.15
      variant1.stub :cost_price => nil
      calculator.compute_item(variant1).should == 5
    end
  end
end
