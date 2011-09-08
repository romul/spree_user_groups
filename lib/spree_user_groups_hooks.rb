class SpreeUserGroupsHooks < Spree::ThemeSupport::HookListener
  insert_after :admin_user_form_roles, 'admin/users/user_group'
  insert_after :admin_configurations_menu do
    "<%= configurations_menu_item(I18n.t(:user_groups), admin_user_groups_path, I18n.t(:manage_user_groups)) %>"
  end
end
