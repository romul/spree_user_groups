Spree::OrdersController.class_eval do
  private
  after_filter :apply_group_adjustment, :only => [:populate]

  def apply_group_adjustment
    @order.user.create_adjustment_for(@order) if @order.user
  end
end
