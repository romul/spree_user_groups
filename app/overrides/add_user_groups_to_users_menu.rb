Deface::Override.new(:virtual_path  => "spree/admin/shared/_main_menu",
                     :name          => "add_user_groups_to_users_menu",
                     :replace       => "erb[loud]:contains('tab *Spree::BackendConfiguration::USER_TABS')",
                     :erb          => "<%= main_menu_tree Spree.t(:users), icon: 'user', sub_menu: 'user', url: '#sidebar-users'")
