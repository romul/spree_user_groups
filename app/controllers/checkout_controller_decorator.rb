CheckoutController.class_eval do
  private
  def before_address
    @order.bill_address ||= Address.new(:country => default_country)
    @order.ship_address ||= Address.new(:country => default_country)
    
    @order.user.create_adjustment_for(@order) if @order.user
  end
end
