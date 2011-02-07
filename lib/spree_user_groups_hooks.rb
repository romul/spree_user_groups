class SpreeUserGroupsHooks < Spree::ThemeSupport::HookListener
  insert_after :admin_user_form_roles, 'admin/users/user_group'
  insert_after :admin_configurations_menu, 'admin/user_groups/configuration_link'
end
