class PrefixUserGroupTablesWithSpree < ActiveRecord::Migration
  def change
    rename_table :user_groups, :spree_user_groups
  end
end