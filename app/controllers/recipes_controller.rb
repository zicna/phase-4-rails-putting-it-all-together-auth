class RecipesController < ApplicationController
  def index
    recipes = Recipe.all
    render json: recipes.as_json(options)
  end

  def create
    recipe = @current_user.recipes.create!(recipe_params)
    render json: recipe.as_json(options), status: :created
  end

  private

  def recipe_params
    params.permit(:user_id, :title, :instructions, :minutes_to_complete)
  end
  def options
    {
  include: [user: {only: [:id, :username, :image_url, :bio]}]
    }
  end
end
