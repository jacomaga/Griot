class Api::V1::CategoriesController < ApplicationController
  include Paginable

  private

  def category_params
    params.require(:category).permit(:id, :name, :description)
  end

  def set_category
    @category = Category.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e }, status: :not_found
  end
end
