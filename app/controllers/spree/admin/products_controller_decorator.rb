Spree::Admin::ProductsController.class_eval do
  def pricing
    params[:price][params[:product_id]].each do |k,v|
      flash.notice = "Pricing has been successfully updated!"

      ugv = Spree::UserGroupsVariant.where(:user_group_id => k).where(:variant_id => params[:product_id]).first
      ugv.destroy if v == '' and ugv
      next if v == ''
      ugv.update_attributes(:price => v) if ugv and ugv.price
      next if ugv
      Spree::UserGroupsVariant.create(:user_group_id => k, :variant_id => params[:product_id], :price => v)
    end if params[:price]
  end
end
