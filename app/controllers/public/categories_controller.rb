class Public::CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @tags = Tag.all
    @category = Category.new
    @tag = Tag.new
    if params[:category_id].present?
      @edit_category = Category.find(params[:category_id])
      @@edit_category = @edit_category
    end
    if params[:tag_id].present?
      @edit_tag = Tag.find(params[:tag_id])
      @@edit_tag = @edit_tag
    end
  end

  def update
    @category = @@edit_category
    @category.update(category_params)
    redirect_to categories_path
  end

  def create
    @category = Category.new(category_params)
    @category.customer_id = current_customer.id
    @category.save
    if params[:chara]
      redirect_to new_character_path
    elsif params[:character_id]
      redirect_to edit_character_path(id: params[:character_id])
    else
      redirect_to categories_path
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :customer_id, :explanation)
  end

end
