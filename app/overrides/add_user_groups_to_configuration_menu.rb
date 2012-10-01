Deface::Override.new(:virtual_path  => "spree/admin/configurations/index",
                     :name          => "add_user_group",
                     :insert_bottom => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
                     :text          => "<%= configurations_menu_item(I18n.t(:user_groups), admin_user_groups_path, I18n.t(:manage_user_groups)) %>")

#  insert_after :admin_user_form_roles, 'admin/users/user_group'
#  insert_after :admin_configurations_menu do
#    "<%= configurations_menu_item(I18n.t(:user_groups), admin_user_groups_path, I18n.t(:manage_user_groups)) %>"
#  end
#end
