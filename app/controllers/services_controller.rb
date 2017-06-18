class ServicesController < ApplicationController

  def show
    # if params.has_key?(:id)
      service = Service.find params[:id]
      # if !service.status  #have to take of the bang!
      @service = service
    #   else
    #     redirect_to services_path
    #   end
    # else
    #   redirect_to services_category_path
    # end
  end

  def new
    @service = Service.new
  end

  def create
    # if can? :create, @service
    @service = Service.new service_params
    # @category = Category.find_by params[:categort_id]
    # @cat = Cat.find_by params[:cat_id]
    @service.organization = current_user
    if @service.save
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  def index

    # if !params[:category_id].present?
      @services = Service.where(status:false)
    # else
    #   # @category = Category.find_by_name params[:id]
    #   @category = Category.find params[:category_id]
    #   @services = @category.services.where(status:false)
    # end

  end



  def delete
    @category = Category.find params[:id]
    @category.destroy
    redirect_to services_path
  end

  private

    def service_params
      params.require(:service).permit([:title, :description, :website, :logo, :category_id, :organization_id, :cat_id])
    end

end
