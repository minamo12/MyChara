class Public::CharactersController < ApplicationController

  def new
    @character = Character.new
    @categories = Category.all
    @tags = Tag.all
    @category = Category.new
    @tag = Tag.new
  end

  def create
    @character = Character.new(character_params)
    @character.customer_id = current_customer.id
    @character.save
    redirect_to customers_my_chara_path
  end

  def show
    @character = Character.find(params[:id])
  end

  def edit
    @character = Character.find(params[:id])
    @category = Category.new
    @tag = Tag.new
  end

  def update
    @character = Character.find(params[:id])
    @character.update(character_params)
    redirect_to character_path(@character.id)
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to customers_my_chara_path
  end

  def search
    @characters = current_customer.characters
    @characters = @characters.search(params[:chara])
    @chara = params[:chara]
    @characters = @characters.uniq

    @customer = current_customer
    @all_characters = @customer.characters
    @all_tags = @customer.tags
    @all_categories = @customer.categories
    render template: "public/customers/show"
  end

  def tag_search
    @characters = current_customer.characters
    @characters = @characters.tag_search(params[:tag])
    @tag = params[:tag]
    @characters = @characters.uniq

    @customer = current_customer
    @all_characters = @customer.characters
    @all_tags = @customer.tags
    @all_categories = @customer.categories
    render template: "public/customers/show"
  end

  def category_search
    @characters = current_customer.characters
    @characters = @characters.category_search(params[:category])
    @category = params[:category]
    @characters = @characters.uniq

    @customer = current_customer
    @all_characters = @customer.characters
    @all_tags = @customer.tags
    @all_categories = @customer.categories
    render template: "public/customers/show"
  end

  private

  def character_params
    params.require(:character).permit(:name, :customer_id, :explanation, :image, :number_a_image, :number_b_image, :number_c_image, category_ids: [], tag_ids: [])
  end

end
