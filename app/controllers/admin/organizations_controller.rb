class Admin::OrganizationsController < Admin::BaseController
  before_action :find_event, only:[:editevent, :destroyevent]
  before_action :find_service, only:[:editservice, :destroyservice]

  def index
    @events = Event.all.limit(6)
    @services = Service.all.limit(5)
  end

  def editevent
    event_params = params.require(:event).permit(:is_approved)
    render json: :event_params
    event.update(is_approved)
  end

  def destroyevent
  end

  def editservice
  end

  def destroyservice
  end

  private

  def find_event
    event = Event.find params[:id]
  end

  def find_service
    service = Service.find params[:id]
  end


end
