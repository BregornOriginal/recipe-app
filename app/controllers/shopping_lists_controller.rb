class ShoppingListsController < ApplicationController
    before_action :authenticate_user!

    def index
        @foods = Food.all
        @recipe_food = RecipeFood.all
    end
end