class DetailsController < ApplicationController
  before_action :authenticate_user!

  def new
    @detail =  current_user.details.build
  end
  
  def create
    @detail = current_user.details.build
    if @detail.update_attributes detail_params      
      redirect_to detail_path(@detail.id, @detail.author.id), flash: { success: 'Created done'}
    else
      render :new
    end
  end
  
  def edit
    @detail = current_user.details.find(params[:id])
  end
  
  def update
    @detail =  current_user.details.find(params[:id])
    if @detail.update_attributes detail_params
      redirect_to detail_path(@detail.id, @detail.author.id), flash: { success: 'Updated done'}
    else
      render :edit
    end
  end
  
  def show
    @detail = current_user.details.find(params[:id])
  end

  def index
    @details = current_user.details.search(params[:search]).paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
  end
 
  def destroy
    @detail = current_user.details.find(params[:id])
    @detail.destroy
    redirect_to details_path, flash: { success: 'Detail destroyed'}
  end
  
  def detail_params
    params.require(:detail).permit(:title, :description, :producer, :original_num, :series_num, :in_price, :sel_price)
  end
  
  
end