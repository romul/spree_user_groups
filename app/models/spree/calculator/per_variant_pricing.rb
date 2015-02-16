class Spree::Calculator::PerVariantPricing < Spree::Calculator
  def self.description
    Spree.t(:per_variant_pricing)
  end
  
  def description
    Spree.t(:per_variant_pricing)
  end
  
  def has_pricing_config
    true
  end

  def compute(object)
    return unless object.present? and object.line_items.present? and object.user.present? and object.user.user_group.present?

    item_total = object.line_items.map(&:amount).sum
    
    item_cost_price_total = object.line_items.map do |li| 
      li_amount = li.variant.price * li.quantity
      ugv = Spree::UserGroupsVariant.where(:user_group_id => object.user.user_group.id, :variant_id => li.variant_id).first
      ugv ? (li.variant.price - ugv.price) * li.quantity : 0
    end.sum
    
    0 - item_cost_price_total
  end
  
  def compute_item(variant)
    variant.price_for_user(current_user)
  end
end
