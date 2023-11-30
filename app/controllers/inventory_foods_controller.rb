class InventoryFoodsController < ApplicationController

  def new
    @inventory = Inventory.find(params[:id])
    @food = Food.all
  end

  def destroy
    @inventory_food = InventoryFood.find(params[:id])
    @inventory = Inventory.find(@inventory_food.inventory_id)
  
    respond_to do |format|
      if @inventory_food.destroy
        flash[:success] = 'Food deleted succesfully'
      else
        flash.now[:error] = 'Error: Food could not be deleted'
        flash.now[:error_details] = @inventory_food.error.full_messages.join(', ')
      end
      format.js { render js: "window.location = '#{inventory_path(inventory: params[:inventory_id] )}'"}
    end
  end
end
