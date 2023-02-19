class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
    @inquiries = Inquiry.where(solve: 'false')
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(:is_active)
  end

end
