class Public::CharactersController < ApplicationController

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @character.customer_id = current_customer.id
    @character.save
    redirect_to customers_my_chara_path
  end

  def show
  end

  def edit
  end

  private

  def character_params
    params.require(:character).permit(:name, :customer_id, :explanation)
  end

end
