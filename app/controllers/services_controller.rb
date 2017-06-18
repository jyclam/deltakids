class ServicesController < ApplicationController

  def show
    @category = Category.find params[:id]
    # @category = Category.find_by_name params[:id]
    @services = @category.services
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new service_params
    @category = Category.find_by params[:categort_id]
    if @service.save
      redirect_to service_path(@category)
    else
      render :new
    end
  end

  private

    def service_params
      params.require(:service).permit([:title, :description, :website, :logo, :category_id, :organization_id])
    end

end
