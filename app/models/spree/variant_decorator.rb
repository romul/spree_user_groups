Spree::Variant.class_eval do
  def price
    return read_attribute(:price) if Spree::User.current.nil? or Spree::User.current.user_group.nil? or Spree::User.current.has_role? 'admin'
    Spree::UserGroupsVariant.where(:user_group_id => Spree::User.current.user_group.id, :variant_id => self.id).try(:first).try(:price) || read_attribute(:price)
  end

  def price_for_group(group)
    Spree::UserGroupsVariant.where(:user_group_id => group.id, :variant_id => self.id).try(:first).try(:price) || read_attribute(:price)
  end

  def price_for_user(user)
    if user && user.user_group
      user.user_group.calculator.compute_item(self)
    else
      price
    end
  end
end
