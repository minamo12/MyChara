class Public::TagsController < ApplicationController

  def create
    @tag = Tag.new(tag_params)
    @tag.customer_id = current_customer.id
    @tag.save
    if params[:chara]
      redirect_to new_character_path
    elsif params[:character_id]
      redirect_to edit_character_path(id: params[:character_id])
    else
      redirect_to categories_path
    end
  end

  def update
    @tag = Tag.find(params[:id])
    binding.pry
    @tag.update(tag_params)
    redirect_to categories_path
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to categories_path
  end

  private

  def tag_params
    params.require(:tag).permit(:tag_name, :customer_id)
  end

end
