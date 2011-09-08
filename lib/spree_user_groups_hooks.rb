class SpreeUserGroupsHooks < Spree::ThemeSupport::HookListener
  insert_after :admin_user_form_roles, 'admin/users/user_group'
  end
end
