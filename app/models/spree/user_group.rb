class Spree::UserGroup < ActiveRecord::Base
  has_many :users, :dependent => :nullify
  validates :name, :presence => true
  has_many :user_groups_variants
  has_many :variants, :through => :user_groups_variants

  include Spree::CalculatedAdjustments
  
  def calculator_description
    return t(:none) if calculator.nil?
    calculator.description
  end

  def price_for_variant variant
    user_groups_variants.where(variant: variant).first.try(:price)
  end
end
