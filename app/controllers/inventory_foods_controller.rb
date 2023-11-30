class InventoryFoodsController < ApplicationController

  def new
    @inventory = Inventory.find(params[:inventory_id])
    @food = Food.all
    @inventory_food = InventoryFood.new

  end

  def create
    @inventory = Inventory.find(params[:inventory_id])
    @food = Food.find(params[:post][:food_id])
    @quantity = params[:post][:quantity]
    @new_food = @inventory.inventory_foods.new(food: @food, quantity: @quantity)

    respond_to do |format|
      if @new_food.save
        flash[:success] = 'Inventory Food created succesfully'
      else
        flash.now[:error] = 'Error: Inventory Food could not be created'
        flash.now[:error_details] = @new_food.error.full_messages.join(', ')
      end
      format.js { render js: "window.location = '#{inventory_path(id: @inventory.id)}'" }
    end
  end

  def destroy
    @inventory_food = InventoryFood.find(params[:id])
    @inventory = Inventory.find(@inventory_food.inventory_id)
  
    respond_to do |format|
      if @inventory_food.destroy
        flash[:success] = 'Inventory Food deleted succesfully'
      else
        flash.now[:error] = 'Error: Inventory Food could not be deleted'
        flash.now[:error_details] = @inventory_food.error.full_messages.join(', ')
      end
      format.js { render js: "window.location = '#{inventory_path(id: @inventory.id )}'" }
    end
  end
end
