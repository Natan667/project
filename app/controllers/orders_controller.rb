class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @order =  current_user.orders.build
  end
  
  def create
    @order = current_user.orders.build
    if @order.update_attributes order_params
       @order.details.build
      redirect_to order_path(@order.id, @order.author.id), flash: { success: 'Created done'}
    else
      render :new
    end
  end
  
  def edit
    @order = current_user.orders.find(params[:id])
  end
  
  def update
    @order =  current_user.orders.find(params[:id])
    if @order.update_attributes order_params
      @order.details.build
      redirect_to order_path(@order.id, @order.author.id), flash: { success: 'Updated done'}
    else
      render :edit
    end
  end
  
  def show
    @order = current_user.orders.find(params[:id])
  end

  def index
    @orders = current_user.orders.search(params[:search]).paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
    @ordersnew = current_user.orders.where(status: "New").search(params[:search]).paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
    @ordersprocessed = current_user.orders.where(status: "Processed").search(params[:search]).paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
    @ordersarchieve = current_user.orders.where(status: "Archieve").search(params[:search]).paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
  end
 
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path, flash: { success: 'Order destroyed'}
  end
  
  def order_params
    params.require(:order).permit(:title, :description, :car, :status, :name, :details_quantity, detail_ids:[])
  end
end