class Public::TagsController < ApplicationController

  def create
    @tag = Tag.new(tag_params)
    @tag.customer_id = current_customer.id
    @tag.save
    if params[:chara]
      redirect_to new_character_path
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
    params.require(:tag).permit(:name, :customer_id)
  end

end
