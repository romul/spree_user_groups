Deface::Override.new(:virtual_path  => "spree/admin/shared/sub_menu/_configuration",
                     :name          => "add_user_groups_to_configuration_menu",
                     :insert_bottom => "[data-hook='admin_configurations_sidebar_menu']",
                     :text          => "<%= configurations_sidebar_menu_item Spree.t(:user_groups), admin_user_groups_path %>")
