class BusinessesController < ApplicationController
  before_action :set_business, only: %i[show]
  respond_to :html

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query OR address ILIKE :query"
      @businesses = Business.where(sql_query, query: "%#{params[:query]}%")
    else
      @businesses = Business.all
    end
  end

  def show

  end

  private

  def set_business
    @business = Business.find(params[:id])
  end

  def business_params
    params.require(:business).permit(:name, :description, :category, :street_address, :image_url)
  end
end
