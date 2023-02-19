class Admin::InquiriesController < ApplicationController

  def index
    @inquiries = Inquiry.all
  end

  def show
    @inquiry = Inquiry.find(params[:id])
    @answer = Answer.new
  end

end
