class Public::HomesController < ApplicationController

  def top
    if customer_signed_in?
      customer = current_customer
      @inquiries = customer.inquiries
    else
    end
  end

end
