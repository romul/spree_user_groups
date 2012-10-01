Spree::Variant.class_eval do
  def price
  current_user=nil
    return read_attribute(:price) if current_user.nil? or current_user.user_group.nil?
    UserGroupsVariant.where(:user_group_id => current_user.user_group.id, :variant_id => self.id).try(:first).try(:price) || read_attribute(:price)
  end

  def price_for_user(user)
    if user && user.user_group
      user.user_group.calculator.compute_item(self)
    else
      price
    end
  end
end
