class ResourcesController < ApplicationController

  before_action :resource_params, only: [:create]

  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
    @locations = ResourceLocation.all
    @age_groups = AgeGroup.all
    @topics = ResourceTopic.all
    @types = ResourceType.all

    # render json: @types
  end

  # don't need location column in resource table
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

        render json: resource.resource_filters
    end

  end





  private

  def resource_params
    params.require(:resource).permit([:name, :feature, :start_date, :end_date, :description, :contact_name, :contact_email])
  end
end
