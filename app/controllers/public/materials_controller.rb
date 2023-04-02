class Public::MaterialsController < ApplicationController

  def index
    @material = Material.new
    @customer = current_customer
    @materials = @customer.materials
  end

  def create
    @material = Material.new(material_params)
    @material.customer_id = current_customer.id
    @material.save
    redirect_to materials_path
  end

  private

  def material_params
    params.require(:material).permit(:material, :customer_id)
  end

end
