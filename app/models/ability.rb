class Ability
  include CanCan::Ability

  def initialize(organization)
	organization ||= Organization.new

	alias_action :create, :read, :update, :delete, to: :crud

	can :crud, Service do |service|
	  service.organization_id = organization.id
	end

	can :crud, Activity do |activity|
	  activity.organization_id = organization.id
	end

	if organization.is_admin?
	  can :manage, :all
	end

end
