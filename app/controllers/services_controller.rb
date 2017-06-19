class ServicesController < ApplicationController

  def show
      service = Service.find params[:id]
      @service = service
  end

  def new
    @service = Service.new
  end

  def create
    # if can? :create, @service
      @service = Service.new service_params
      @service.organization = current_org
      if @service.save
        redirect_to organizations_dashboard_path, notice: 'Service created, pending approval.'
      else
        render :new
      end
    # else
    #   head :unauthorized
    # end
  end

  def index
    @services = Service.where(status:true)
  end



  def delete
    @category = Category.find params[:id]
    @category.destroy
    redirect_to services_path
  end

  private

  def service_params
    params.require(:service).permit([:title, :description, :website, :logo, :category_id, :cat_id])
  end

end
