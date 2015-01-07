require File.dirname(__FILE__) + '/../../spec_helper'

describe 'Spree::Calculator::PerVariantPricing based on cost_price' do
  let(:user_group) { mock_model(Spree::UserGroup, :name => 'Wholesaler')}
  let(:calculator) { Spree::Calculator::PerVariantPricing.new }
  let(:variant1) { mock_model(Spree::Variant, :cost_price => 3, :price => 5) }
  let(:variant2) { mock_model(Spree::Variant, :cost_price => 12, :price => 20) }

  let(:order) { mock_model Spree::Order, :line_items => [mock_model(Spree::LineItem, :amount => 10, :quantity => 2, :variant => variant1), mock_model(Spree::LineItem, :amount => 20, :quantity => 1, :variant => variant2)], :user => mock_model(Spree::User, :user_group => user_group ) }

  before {
    Spree::UserGroupsVariant.create(:variant_id => variant1.id, :user_group_id => user_group.id, :price => 3)
    Spree::UserGroupsVariant.create(:variant_id => variant2.id, :user_group_id => user_group.id, :price => 18)
    }

  context "compute" do
    it "should compute amount correctly" do
      calculator.compute(order).should == -6
    end
  end
end
