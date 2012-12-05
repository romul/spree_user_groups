Spree::CheckoutController.class_eval do
  private
  def before_address
    @order.bill_address ||= Spree::Address.default
    @order.ship_address ||= Spree::Address.default
  end
end
