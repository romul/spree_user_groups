Product.class_eval do
  def price_for_user(user)
    self.master.price_for_user(user)
  end
end
