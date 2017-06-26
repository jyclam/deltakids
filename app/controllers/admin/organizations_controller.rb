class Admin::OrganizationsController < Admin::BaseController
  before_action :find_event, only:[:editevent, :destroyevent]
  before_action :find_service, only:[:editservice, :destroyservice]

  def index
    @events = Event.all.order(created_at: :desc).limit(6)
    @services = Service.all.order(created_at: :desc).limit(6)
    @resources = Resource.order(created_at: :desc).limit(3)
  end

  def editevent
    event = Event.find params[:id]
    event_params = params.permit(:is_approved)
    event.update(event_params)
    redirect_to admin_organizations_path, notice: 'Event approved'
  end

  def destroyevent
    event = Event.find params[:id]
    event.destroy
    redirect_to admin_organizations_path, alert: 'Event deleted.'
  end

  def editservice
    service = Service.find params[:id]
    service_params = params.permit(:status)
    service.update(service_params)
    redirect_to admin_organizations_path, notice: 'Service approved'
  end

  def destroyservice
    service = Service.find params[:id]
    service.destroy
    redirect_to admin_organizations_path, alert: 'Service deleted.'
  end

  private

  def find_event
    event = Event.find params[:id]
  end

  def find_service
    service = Service.find params[:id]
  end


end
