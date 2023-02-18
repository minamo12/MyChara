class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
    @characters = @customer.characters
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

  private

  def customer_params
    params.require(:customer).permit(:name, :is_active)
  end

end
