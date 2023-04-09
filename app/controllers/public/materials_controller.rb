class Public::MaterialsController < ApplicationController

  def index
    @customer = current_customer
    @materials = @customer.materials
  end

  def new
    @material = Material.new
    @tag = Tag.new
    @category = Category.new
  end

  def create
    @material = Material.new(material_params)
    @material.customer_id = current_customer.id
    @material.save
    redirect_to materials_path
  end

  def show
    @material = Material.find(params[:id])
  end

  def destroy
    @material = Material.find(params[:id])
    @material.destroy
    redirect_to materials_path
  end

  def edit
    @material = Material.find(params[:id])
    @category = Category.new
    @tag = Tag.new
  end

  def update
    @material = Material.find(params[:id])
    @material.update(material_params)
    redirect_to materials_path
  end

  private

  def material_params
    params.require(:material).permit(:material, :customer_id, :material_title, category_ids: [], tag_ids: [])
  end

end
