Spree::Variant.class_eval do
  def price_for_user(user)
    if user && user.user_group
      user.user_group.calculator.compute_item(self)
    else
      price
    end
  end

  def price
    return prices.first.amount.to_f if Spree::User.current.nil? or Spree::User.current.user_group.nil?
    Spree::UserGroupsVariant.where(:user_group_id => Spree::User.current.user_group.id, :variant_id => self.id).try(:first).try(:price) || prices.first.amount.to_f
  end

  #TODO-Proper fix for this hack :)
  def price_in(currency)
    Spree::Price.new(:amount => price, :currency => "USD")
  end
end
