class Spree::UserGroupsVariant < ActiveRecord::Base
  belongs_to :variant
  belongs_to :user_group
  attr_accessible :user_group_id, :variant_id, :price
end
