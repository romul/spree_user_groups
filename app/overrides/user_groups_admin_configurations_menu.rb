Deface::Override.new(:virtual_path => "spree/admin/configurations/index",
                     :name => "user_groups_admin_configurations_menu",
                     :insert_after => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
                     :text => "<%= configurations_menu_item(I18n.t(:user_groups), admin_user_groups_path, I18n.t(:manage_user_groups)) %>",
                     :disabled => false)