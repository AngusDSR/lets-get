class BusinessesController < ApplicationController
  # before_action :set_business, only: %i[show]
  # Move this down to the show action
  respond_to :html

  def index
    if params[:query].present?
      @businesses = Business.where(category: params[:query])
    else
      @businesses = Business.all
    end
  end

  def show
    @business = Business.find(params[:id])
  end

  def destroy
  end

  def create
    @business = Business.new(business_params)
    @business.user = current_user
    if @business.save
      redirect_to businesses_path(user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @business = Business.new
  end

  private

  # def set_business
  # @business = Business.find(params[:id])
  # end

  def business_params
    params.require(:business).permit(:name, :description, :category, :street_address, :image_url)
  end
end
