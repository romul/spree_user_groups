class Spree::Admin::UserGroupsController < Spree::Admin::ResourceController
  :resource_controller
  before_filter :load_data

  update do
    redirect_to edit_object_url
    wants.html
  end

  create do
    redirect_to edit_object_url
    wants.html
  end

  destroy do
    success do
      render_js_for_destroy
      wants.js
    end
  end

  def pricing
    @group = Spree::UserGroup.find(params[:id])
    params[:price][params[:id]].each do |k,v|
      ugv = UserGroupsVariant.where(:user_group_id => params[:id]).where(:variant_id => k).first
      ugv.destroy if v == '' and ugv
      next if v == ''
      ugv.update_attributes(:price => v) if ugv and ugv.price
      next if ugv
      UserGroupsVariant.create(:user_group_id => params[:id], :variant_id => k, :price => v)
    end if params[:price]
  end
  
  private
  def build_object
    @object ||= end_of_association_chain.send((parent? ? :build : :new), object_params)
    @object.calculator = params[:user_group][:calculator_type].constantize.new if params[:user_group]
  end

  def load_data
    @calculators = Spree::UserGroup.calculators
  end
end
