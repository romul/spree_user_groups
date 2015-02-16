Spree::Product.class_eval do
  def price_for_user(user, currency = nil)
    self.master.price_for_user(user, currency)
  end
end
