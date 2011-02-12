Order.class_eval do

  # Associates the specified user with the order and destroys any previous association with guest user if necessary.
  def associate_user!(user)
    self.user = user
    self.email = user.email
    
    # Create adjustment for user group
    self.user.create_adjustment_for(self)
    
    # disable validations since this can cause issues when associating an incomplete address during the address step
    save(:validate => false)
  end
end
