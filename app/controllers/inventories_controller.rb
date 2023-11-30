class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[show destroy]

  def index
    @inventories = current_user.inventories
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def new
    @inventory = current_user.inventories.build
  end

  def create
    @inventory = current_user.inventories.build(inventory_params)
    if @inventory.save
      redirect_to @inventory, notice: 'Inventory was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @inventory.destroy
    redirect_to inventories_path, notice: 'Inventory was successfully destroyed.'
  end

  private

  def set_inventory
    @inventory = current_user.inventories.find(params[:id])
  end

  def inventory_params
    params.require(:inventory).permit(:name)
  end
end
