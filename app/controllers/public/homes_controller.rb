class Public::HomesController < ApplicationController

  def top
    customer = current_customer
    @inquiries = customer.inquiries
  end

end
