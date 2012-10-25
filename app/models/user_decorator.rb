User.class_eval do
  belongs_to :user_group
  attr_accessible :user_group_id
  
  before_save :set_user_group
  
  def create_adjustment_for(order)
    if self.user_group && order.adjustments.where(:originator_type => "UserGroup").count == 0
      self.user_group.create_adjustment(I18n.t(:user_group_adjustment, :name => self.user_group.name), order, order, true)
    end
  end
  
  def user_group_name
    self.user_group.name
  end
  
  private
  
  def set_user_group
    self.user_group ||= UserGroup.find_by_name Spree::Config[:default_user_group]
  end
end
