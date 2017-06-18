class ServicesController < ApplicationController
before_action :authenticate_org!, except: [:index, :show]


  def show
      service = Service.find params[:id]
      @service = service
  end

  def new
    @service = Service.new
  end

  def create

    @service = Service.new service_params
    @service.organization = current_org
    if @service.save
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  def index
      @services = Service.where(status:false)
  end



  def delete
    if can? :destroy, @question
      @category = Category.find params[:id]
      @category.destroy
      redirect_to services_path
    else
      head :unauthorized
    end
  end

  private

    def service_params
      params.require(:service).permit([:title, :description, :website, :logo, :category_id, :organization_id, :cat_id])
    end

end
