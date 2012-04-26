Deface::Override.new(:virtual_path => "spree/admin/shared/_product_tabs",
                     :name => "add_product_pricing_tab",
                     :insert_top => "[data-hook='admin_product_tabs']",
                     :partial => "spree/admin/products/product_pricing",
                     :disabled => false)