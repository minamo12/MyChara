class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
    @characters = @customer.characters
    @all_characters = @customer.characters
    @all_tags = @customer.tags
    @all_categories = @customer.categories

    if params[:tag_id].present?
      tag = Tag.find(params[:tag_id])
      @characters = tag.characters
    end

    if params[:category_id].present?
      category = Category.find(params[:category_id])
      @characters = category.characters
    end
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_my_chara_path
  end

  def withdraw
    @customer = current_customer
    @customer.update(customer_params)
    reset_session
    redirect_to root_path
  end

  def destroy
    @customer = current_customer
    @customer.destroy
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :is_active)
  end

end
