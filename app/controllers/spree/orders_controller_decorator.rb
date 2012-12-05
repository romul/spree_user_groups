Spree::OrdersController.class_eval do 
  after_filter :create_user_group_adjustment, :only => :populate

  def create_user_group_adjustment
    return if Spree::User.current.nil? || Spree::User.current.user_group.nil?

    @adj = Spree::Adjustment.first(:conditions => [ "label = ? and source_id = ? and source_type = ? and adjustable_id = ? and adjustable_type = ?", 
                                                       "#{t(:user_group_adjustment)}",
                                                       Spree::User.current.user_group.id,
                                                       "Spree::UserGroup",
                                                       @order.id,
                                                       "Spree::Order"])

    if @adj.nil?
      @adj = Spree::Adjustment.new(:amount => 0, :label => I18n.t(:user_group_adjustment))
      @adj.source = Spree::User.current.user_group
      @adj.adjustable = @order
    end
    
    total_for_user = 0

    @order.line_items.each do |l|
      total_for_user = (l.variant.price_for_user(Spree::User.current) * l.quantity)
    end
       
    @adj.amount = (total_for_user - @order.item_total) || 0
    @adj.save
  end
end
