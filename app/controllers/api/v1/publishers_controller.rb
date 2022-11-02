class Api::V1::PublishersController < ApplicationController
  include Paginable
  before_action :set_publisher, only: %i[show destroy update]

  def create
    @publisher = Publisher.new(publisher_params)

    if @publisher.save
      render json: @publisher, status: :created
    else
      render json: { errors: @publisher.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @publisher.update(publisher_params)
      render json: PublisherSerializer.new(@publisher).serializable_hash, status: :ok
    else
      render json: { errors: @publisher.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    if @publisher.destroy
      head :no_content
    else
      head :unprocessable_entity
    end
  end

  def show
    render json: PublisherSerializer.new(@publisher).serializable_hash, status: :ok
  end

  def index
    @publishers = Publisher.page(current_page)
                           .per(per_page)
                           .search(params)

    options = get_links_serializer_options('api_v1_publishers_path', @publishers)

    render json: PublisherSerializer.new(@publishers, options).serializable_hash, status: :ok
  end

  private

  def publisher_params
    params.require(:publisher).permit(:id, :name, :description)
  end

  def set_publisher
    @publisher = Publisher.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e }, status: :not_found
  end
end
