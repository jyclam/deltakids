class ServicesController < ApplicationController

  def show

  end

  def new
    @service = Service.new
  end

  def create
    # if can? :create, @service
    @service = Service.new service_params
    @category = Category.find_by params[:categort_id]
    if @service.save
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  def index
    # @category = Category.find params[:id]
    # @category = Category.find_by_name params[:id]
    if !params[:category_id].present?
      @services = Service.find_by_status(true)
    else
      # @category = Category.find_by_name params[:id]
      @category = Category.find params[:category_id]
      @services = @category.services.find_by_status(true)
    end

  end



  def delete
    @category = Category.find params[:id]
    @category.destroy
    redirect_to services_path
  end

  private

    def service_params
      params.require(:service).permit([:title, :description, :website, :logo, :category_id, :organization_id])
    end

end
