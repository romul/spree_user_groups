class UserGroupsVariant < ActiveRecord::Base
  belongs_to :variant
  belongs_to :user_group
end