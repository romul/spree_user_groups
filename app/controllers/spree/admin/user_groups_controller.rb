class Spree::Admin::UserGroupsController < Spree::Admin::ResourceController
  before_filter :load_data


  def pricing
    params[:price][params[:id]].each do |k,v|
      ugv = Spree::UserGroupsVariant.where(:user_group_id => params[:id]).where(:variant_id => k).first
      ugv.destroy if v == '' and ugv
      next if v == ''
      ugv.update_attributes(:price => v) if ugv and ugv.price
      next if ugv
      Spree::UserGroupsVariant.create!(:user_group_id => params[:id], :variant_id => k, :price => v)
      flash.notice = Spree.t(:variant_pricing_updated_successfully)
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
