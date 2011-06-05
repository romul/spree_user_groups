Variant.class_eval do

def price
	return read_attribute(:price) if User.current.nil? or User.current.user_group.nil?
	UserGroupsVariant.where(:user_group_id => User.current.user_group.id, :variant_id => self.id).try(:first).try(:price) || read_attribute(:price)
end

  def price_for_user(user)
    if user && user.user_group
      user.user_group.calculator.compute_item(self)
    else
      price
    end
  end
end
