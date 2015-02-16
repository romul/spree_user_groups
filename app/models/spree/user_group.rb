class Spree::UserGroup < ActiveRecord::Base
  has_many :users, :dependent => :nullify
  validates :name, :presence => true
  has_many :user_groups_variants
  has_many :variants, :through => :user_groups_variants

  extend Spree::DisplayMoney
  money_methods :minimum_order

  include Spree::CalculatedAdjustments
  
  def calculator_description
    return Spree.t(:none) if calculator.nil?
    calculator.description
  end

  def price_for_variant variant, orig_price
    if calculator.is_a?(Spree::Calculator::PerVariantPricing)
      user_groups_variants.where(variant: variant).first.try(:price)
    else
      calculator.compute_item(variant, orig_price)
    end
  end
end
