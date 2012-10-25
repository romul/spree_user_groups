Adjustment.class_eval do
  scope :user_group_adjustments, lambda { where(:originator_type => "UserGroup")}
end