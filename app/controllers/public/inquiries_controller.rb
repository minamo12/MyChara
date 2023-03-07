class Public::InquiriesController < ApplicationController

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inqury_params)
    @inquiry.customer_id = current_customer.id
    @inquiry.save
    redirect_to root_path
  end

  def update
    @inquiry = Inquiry.find(params[:id])
    @inquiry.update(inqury_params)
    if params[:inquiry_index]
      redirect_to admin_inquiries_path
    else
      redirect_to root_path
    end
  end

  private

  def inqury_params
    params.require(:inquiry).permit(:inquiry, :content, :solve, :customer_id)
  end

end
