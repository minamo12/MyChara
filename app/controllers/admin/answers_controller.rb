class Admin::AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    @answer.save
    redirect_to admin_inquiry_path(@answer.inquiry_id)
  end

  private

  def answer_params
    params.require(:answer).permit(:inquiry_id, :customer_id, :answer)
  end

end
