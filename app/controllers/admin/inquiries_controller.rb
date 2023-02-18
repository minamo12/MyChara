class Admin::InquiriesController < ApplicationController

  def index
    @inquiries = Inquiry.all
  end

  def show
  end

end
