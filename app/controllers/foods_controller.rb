class FoodsController < ApplicationController
  # before_action :set_food, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /foods or /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/1 or /foods/1.json
  def show; end

  # GET /foods/new
  def new
    @food = Food.new
    respond_to do |format|
      format.html { render :new, locals: { post: @food } }
    end
  end

  # POST /foods or /foods.json
  def create
    @food = Food.new(food_params)
    @food.user = current_user

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_path(current_user), notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @user = current_user
    @food = Food.find(params[:id])
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url(@user.id), notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
