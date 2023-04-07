class Public::MaterialsController < ApplicationController

  def index
    @material = Material.new
    @customer = current_customer
    @materials = @customer.materials
    if params[:material_id].present?
      @edit_material = Material.find(params[:material_id])
      @@edit_material = @edit_material
    end
  end

  def create
    @material = Material.new(material_params)
    @material.customer_id = current_customer.id
    @material.save
    redirect_to materials_path
  end

  def destroy
    @material = Material.find(params[:id])
    @material.destroy
    redirect_to materials_path
  end

  def update
    @material = @@edit_material
    @material.update(material_params)
    redirect_to materials_path
  end

  private

  def material_params
    params.require(:material).permit(:material, :customer_id)
  end

end
