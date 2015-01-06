path="spree/admin/user_groups"

Deface::Override.new(:virtual_path=> "#{path}/index",
  :name=> "minimum_order_column_header",
  :insert_before => "th[3]",
  :text=> "<th width='0px'>Minimum Order</th>",
  :original=> "a8447ceffcd5c4085af882f72f0e2f322c442726")

Deface::Override.new(:virtual_path=> "#{path}/index",
  :name=> "minimum_order_column_body",
  :insert_after=> "erb[loud]:contains('user_group.calculator_description')",
  :text=> "<td><%= user_group.minimum_order %></td>")

Deface::Override.new(:virtual_path=> "#{path}/_form",
  :name=> "minimum_order_edit_field",
  :insert_after=> "erb[loud]:contains('f.text_field :name')",
  :text=> "<br /> <%= f.label :minimum_order %> <br /> <%= f.text_field :minimum_order %>")
