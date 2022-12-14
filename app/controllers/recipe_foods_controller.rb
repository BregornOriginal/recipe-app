class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!

  def new
    @recipe_food = RecipeFood.new
    @foods = Food.where(user: current_user)
    @food = Food.find_by(id: @recipe_food.food_id)
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = RecipeFood.new(recipe_food_params)
    @recipe_foods.recipe = @recipe
    respond_to do |format|
      if @recipe_foods.save
        format.html do
          redirect_to recipe_url(@recipe), notice: 'Recipe food was successfully created.'
        end
        format.json { render :show, status: :created, location: @recipe_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @recipe_food.destroy

    respond_to do |format|
      format.html do
        redirect_to recipe_url(current_user, @recipe), notice: 'Recipe food was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
