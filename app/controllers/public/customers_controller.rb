class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
    if @customer.id == current_customer.id
    else
      redirect_to root_path
    end
  end

  def updates
    @customer = Customer.find(params[:id])
    if @customer.id == current_customer.id
      @customer.update(customer_params)
      redirect_to customer_path(@customer.id)
    else
      redirect_to root_path
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name)
  end

end
