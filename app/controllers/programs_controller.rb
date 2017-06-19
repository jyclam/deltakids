class ProgramsController < ApplicationController

  def show
    @program = Program.find params[:id]
    # @activities = Activity.all.where(age_group: @program.age_group)
    @activities = Activity.all.where(program: @program)
    # @activites = @activities.where()
    @organizations = {}

    @activities.each do |a|
      if @organizations[a.organization.title.to_sym].nil?
        @organizations[a.organization.title.to_sym] = [a.name]
      else
        @organizations[a.organization.title.to_sym] = @organizations[a.organization.title.to_sym].push(a.name)
      end
    end
  end


  def showage
    age_group = AgeGroup.find params[:id]
    @program = age_group.programs.first
    @activities = Activity.all.where(age_group: params[:id])

    @organizations = {}

    @activities.each do |a|
      if @organizations[a.organization.title.to_sym].nil?
        @organizations[a.organization.title.to_sym] = [a.name]
      else
        @organizations[a.organization.title.to_sym] = @organizations[a.organization.title.to_sym].push(a.name)
      end
    end

    render :show
  end

end
