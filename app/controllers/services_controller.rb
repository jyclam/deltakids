class ServicesController < ApplicationController

  def show
    # @category = Category.find params[:id]
    @service = Service.find params[:id]
    # @category = Category.find_by_name params[:id]
    @services = @category.services
  end

  def new
    @service = Service.new
  end

  def create
    # if can? :create, @service
    @service = Service.new service_params
    @category = Category.find_by params[:categort_id]
    if @service.save
      redirect_to service_path(@category)
    else
      render :new
    end
  end

  def index
    # @category = Category.find params[:id]
    # @category = Category.find_by_name params[:id]
    if !params[:categort_id].present?
      debugger
      @services = Service.find_by_status(true)
    else
      # @category = Category.find_by_name params[:id]
      @category = Category.find params[:id]
      @services = @category.services
    end

  end
#
#   if params.has_key? :user_id
#   @user = User.find(params[:user_id])
#   @questions = @user.liked_questions.order(created_at: :desc)
# else
#   @questions = Question.recent(30)
# end



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
