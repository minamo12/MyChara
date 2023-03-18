class Admin::InquiriesController < ApplicationController

  def index
    @inquiries = Inquiry.all

    if params[:revival].present?
      @inquiries = Inquiry.where(content: '0')
    elsif params[:delete].present?
      @inquiries = Inquiry.where(content: '1')
    elsif params[:how].present?
      @inquiries = Inquiry.where(content: '2')
    elsif params[:other].present?
      @inquiries = Inquiry.where(content: '3')
    elsif params[:solve_false].present?
      @inquiries = Inquiry.where(solve: 'false')
    elsif params[:solve_true].present?
      @inquiries = Inquiry.where(solve: 'true')
    end

  end

  def show
    @inquiry = Inquiry.find(params[:id])
    @answer = Answer.new
  end

end
