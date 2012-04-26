Deface::Override.new(:virtual_path => "spree/admin/users/index",
                     :name => "add_user_group_to_user_index_header",
                     :insert_before => "[data-hook='admin_users_index_header_actions']",
                     :text => '<th><%= sort_link @search, :user_group, "User Group", {} %></th>')

Deface::Override.new(:virtual_path => "spree/admin/users/index",
                     :name => "add_user_group_to_user_index_list",
                     :insert_before => "[data-hook='admin_users_index_row_actions']",
                     :text => '<td width="100px"><%= user.user_group.name %></td>')
