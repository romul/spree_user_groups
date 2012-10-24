class Spree::UserGroup < ActiveRecord::Base
  has_many :users, :dependent => :nullify
  has_many :user_groups_variants
  has_many :variants, :through => :user_groups_variants
  
  attr_accessible :name
  validates :name, :presence => true
  
  
  calculated_adjustments
  
  def calculator_description
    return t(:none) if calculator.nil?
    calculator.description
  end
end
