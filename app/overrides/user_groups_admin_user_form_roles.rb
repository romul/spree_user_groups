Deface::Override.new(:virtual_path => "spree/admin/users/_form",
                     :name => "converted_admin_user_form_roles",
                     :insert_after => "[data-hook='admin_user_form_roles'], #admin_user_form_roles[data-hook]",
                     :partial => "spree/admin/users/user_group",
                     :disabled => false)