class Api::V1::PicturesController < ApplicationController
  include Paginable
  before_action :set_picture, only: %i[show destroy update]

  def create
    @picture = Picture.new(picture_params)

    if @picture.save
      render json: @picture, status: :created
    else
      render json: { errors: @picture.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @picture.destroy
    head :no_content
  end

  def update
    if @picture.update(picture_params)
      render json: PictureSerializer.new(@picture).serializable_hash, status: :ok
    else
      render json: { errors: @picture.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: PictureSerializer.new(@picture).serializable_hash, status: :ok
  end

  def index
    @pictures = Publisher.includes(:publisher)
                         .page(current_page)
                         .per(per_page)
                         .search(params)

    options = get_links_serializer_options('api_v1_pictures_path', @pictures)

    render json: PictureSerializer.new(@picture, options).serializable_hash
  end

  private

  def picture_params
    params.require(:picture).permit(:description, :category, :url, :publisher_id, :picture)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e }, status: :not_found
  end
end
