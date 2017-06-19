class ResourcesController < ApplicationController
  # don't need location column in resource table
      # - change in model after consulting with john
  # might have to add a column for approval status after


  before_action :resource_params, only: [:create]

  def index
    @locations = ResourceLocation.all
    @age_groups = AgeGroup.all
    @topics = ResourceTopic.all
    @types = ResourceType.all

    # @resources = Resource.all
    @resources = Resource.where(feature: true)
  end


  def filter
    @locations = ResourceLocation.all
    @age_groups = AgeGroup.all
    @topics = ResourceTopic.all
    @types = ResourceType.all

    filters = ResourceFilter.all

    if params[:location]
      filters = ResourceFilter.where(resource_location_id: params[:location])
    end

    if params[:type]
      filters = filters.where(resource_type_id: params[:type])
    end

    if params[:topic_ids]
      filters = filters.where(resource_topic_id: params[:topic_ids])
    end

    if params[:age_group_ids]
      filters = filters.where(age_group_id: params[:age_group_ids])
    end

    @resources = []
    resource_ids = []
    filters.each do |filter|

      @resources.push(filter.resource) unless resource_ids.include?(filter.resource_id)
      resource_ids.push(filter.resource_id) unless resource_ids.include?(filter.resource_id)

    end
    # render json: filters
    render :index
    # redirect_to @resources
  end

  def new
    @resource = Resource.new
    @locations = ResourceLocation.all
    @age_groups = AgeGroup.all
    @topics = ResourceTopic.all
    @types = ResourceType.all
  end

  def create
    resource = Resource.new resource_params

    if resource.save
      location_id = params[:location]
      type_id = params[:type]
      age_groups_ids = params[:age_group_ids]
      topic_ids = params[:topic_ids]

      location = ResourceLocation.find_by_id location_id
      type = ResourceType.find_by_id type_id

      age_groups_ids.each do |age_group_id|
        age_group = AgeGroup.find_by_id age_group_id
        topic_ids.each do |topic_id|
          topic = ResourceTopic.find_by_id topic_id
          ResourceFilter.create({
            resource: resource,
            age_group: age_group,
            resource_topic: topic,
            resource_location: location,
            resource_type: type
            })
          end
        end
        # render json: params
        # redirect_to resource_path(resource), notice: 'Resource created'
        redirect_to :resource_submitted

    end

  end

  def submitted
  end

  def show
    @resource = Resource.find params[:id]
  end



  private

  def resource_params
    params.require(:resource).permit([:name, :feature, :start_date, :end_date, :description, :contact_name, :contact_email])
  end
end
