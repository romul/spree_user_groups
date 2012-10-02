Spree::User.class_eval do
  belongs_to :user_group
  attr_accessible :user_group_id
  
  def create_adjustment_for(order)
    if self.user_group && order.adjustments.where(:originator_type => "UserGroup").count == 0
      self.user_group.create_adjustment(I18n.t(:user_group_adjustment), order, order, true)
    end
  end
end
