require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  setup do
    login 'admin', 'password'
    @recipe = recipes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recipes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recipe" do
    assert_difference('Recipe.count') do
      post :create, recipe: { ingredients: @recipe.ingredients, instructions: @recipe.instructions, title: @recipe.title }
    end

    assert_redirected_to recipe_path(assigns(:recipe))
  end

  test "should show recipe" do
    get :show, id: @recipe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recipe
    assert_response :success
  end

  test "should update recipe" do
    patch :update, id: @recipe, recipe: { ingredients: @recipe.ingredients, instructions: @recipe.instructions, title: @recipe.title }
    assert_redirected_to recipe_path(assigns(:recipe))
  end

  test "should destroy recipe" do
    assert_difference('Recipe.count', -1) do
      delete :destroy, id: @recipe
    end

    assert_redirected_to recipes_path
  end
end

private
  def login(username, password)
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials username, password
      request.env['HTTP_AUTHORIZATION'] = credentials
    end
