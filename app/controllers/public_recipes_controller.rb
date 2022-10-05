class PublicRecipesController < ApplicationController
  #  before_action :authenticate_user!
  # GET /recipes or /recipes.json
  def index
    @public_recipes = Recipe.all.where(public: true).order(created_at: :desc)
  end
end
