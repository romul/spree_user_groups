class SpreeUserGroupsHooks < Spree::ThemeSupport::HookListener
  insert_after :admin_user_form_roles, 'admin/users/user_group'
  
  insert_after :admin_tabs do 
    '<%= tab :user_groups %>'
  end
  
  insert_after :admin_users_index_search, 'admin/user_groups/search_field'
end
