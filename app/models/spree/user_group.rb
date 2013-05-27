class Spree::UserGroup < ActiveRecord::Base
  has_many :users, :dependent => :nullify
  validates :name, :presence => true
  has_many :user_groups_variants
  has_many :variants, :through => :user_groups_variants
  attr_accessible :name, :minimum_order

  include Spree::Core::CalculatedAdjustments
  
  def calculator_description
    return t(:none) if calculator.nil?
    calculator.description
  end
end
