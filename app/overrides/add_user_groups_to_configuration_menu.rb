Deface::Override.new(:virtual_path  => "spree/admin/configurations/index",
                     :name          => "add_user_group",
                     :insert_bottom => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
                     :text          => "<%= configurations_menu_item(I18n.t(:user_groups), admin_user_groups_path, I18n.t(:manage_user_groups)) %>")

Deface::Override.new(:virtual_path  => "spree/admin/shared/_configuration_menu",
                     :name          => "add_user_groups_to_configuration_menu",
                     :insert_bottom => "[data-hook='admin_configurations_sidebar_menu'], #admin_configurations_sidebar_menu[data-hook]",
                     :text          => "<%= configurations_sidebar_menu_item t(:user_groups), admin_user_groups_path %>")
