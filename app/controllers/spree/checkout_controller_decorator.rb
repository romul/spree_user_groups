# Spree::CheckoutController.class_eval do
#   private
#   # def before_address
#   #   # @order.bill_address ||= Address.default
#   #   # @order.ship_address ||= Address.default
    
#   #   @order.user.create_adjustment_for(@order) if @order.user
#   # end

#   before_filter :apply_group_adjustment

#   def apply_group_adjustment
#     @order.user.create_adjustment_for(@order) if @order.user
#   end
# end
