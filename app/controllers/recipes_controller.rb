class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @recipes = Recipe.where(user_id: @user).order(updated_at: :asc)
    @current_user = current_user
  end

  def show
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @recipes = Recipe.where(user_id: @user).order(updated_at: :asc)
    @recipes = Recipe.find_by(id: params[:recipe_id])
    @recipe_foods = RecipeFood.where(recipe: @recipe)
  end

  def new
    @user = current_user
    recipe = Recipe.new
    respond_to do |format|
      format.html { render :new, locals: { recipe: } }
    end
  end

  def create
    @user = current_user
    @recipe = @user.recipes.create(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to user_recipes_path(@user.id), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to user_recipes_path(@user.id), notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preperation_time, :cooking_time, :description, :public)
  end
end
