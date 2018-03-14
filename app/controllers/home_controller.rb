class HomeController < ApplicationController

  def index
    @number_of_recipes = Recipe.count
    @title = "Cookbook"
  end

  def about
    @title = "About"
  end

  def contact
    @title = "Contact"
  end
end
