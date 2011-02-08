class Admin::UserGroupsController < Admin::BaseController
  resource_controller
  before_filter :load_data

  update.wants.html { redirect_to edit_object_url }
  create.wants.html { redirect_to edit_object_url }
  destroy.success.wants.js { render_js_for_destroy }
  
  private
  def build_object
    @object ||= end_of_association_chain.send((parent? ? :build : :new), object_params)
    @object.calculator = params[:user_group][:calculator_type].constantize.new if params[:user_group]
  end

  def load_data
    @calculators = UserGroup.calculators
  end
end
