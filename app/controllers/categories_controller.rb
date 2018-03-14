class CategoriesController < ApplicationController

  before_action :set_category, only: [:show]

  # GET /recipes
  # GET /recipes.json
  def index
    @categories = Category.all

  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipes = @category.recipes
  end

  def set_category
    #abort(params.inspect)
    @category = Category.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.

  def get_recipes
    @recipes = Recipe.all.collect{|r| [r.category_id] }
  end




end
