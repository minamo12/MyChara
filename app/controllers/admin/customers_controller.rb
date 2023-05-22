class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all

    if params[:is_active_true].present?
      @customers = Customer.where(is_active: 'true')
    end
    if params[:is_active_false].present?
      @customers = Customer.where(is_active: 'false')
    end
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customers_path
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to admin_customers_path
  end

  def customer_search
    @customers = Customer.customer_name_search(params[:customer_name])
    render "index"
  end

  private

  def customer_params
    params.require(:customer).permit(:is_active)
  end

end
