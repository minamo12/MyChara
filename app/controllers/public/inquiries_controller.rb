class Public::InquiriesController < ApplicationController

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inqury_params)
    @inquiry.customer_id = current_customer.id
    binding.pry
    @inquiry.save
    redirect_to root_path
  end

  private

  def inqury_params
    params.require(:inquiry).permit(:inquiry, :content, :solve, :customer_id)
  end

end
