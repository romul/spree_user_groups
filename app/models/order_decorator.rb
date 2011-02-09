Order.state_machines[:state].after_transition :to => 'delivery', :do => :create_adjustment_for_user_group!

Order.class_eval do
  
  def create_adjustment_for_user_group!
    user = User.current || self.user
    if user && user.user_group
      user.user_group.create_adjustment(I18n.t(:user_group), self, self, true)
    end
  end

end
