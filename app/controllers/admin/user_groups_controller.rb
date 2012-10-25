class Admin::UserGroupsController < Admin::BaseController
  resource_controller
  before_filter :load_data

  update.wants.html { redirect_to edit_object_url }
  create.wants.html { redirect_to edit_object_url }
  destroy.success.wants.js { render_js_for_destroy }
  
  def pricing
    @group = UserGroup.find(params[:id])
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
    @calculators = UserGroup.calculators
  end
  

end
