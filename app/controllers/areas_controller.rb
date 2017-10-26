class AreasController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_area, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :destroy]

  def index
    @subject = Subject.find(params[:subject_id])
    @areas = @subject.areas
  end

  def show
    @subject = Subject.find(params[:subject_id])
    @area = @subject.areas.find(params[:id])
  end

  def new
    @subject = Subject.find(params[:subject_id])
    @area = @subject.areas.build
  end

  def create
    @subject = Subject.find(params[:subject_id])
    @area = @subject.areas.create(area_params)
    if @area.save
      redirect_to subject_area_path(@area.subject, @area), notice: 'Area was successfully created.'
    else
      redirect_to @subject, notice: 'Oops!'
    end
  end

  def edit
    @subject = Subject.find(params[:subject_id])
    @area = @subject.areas.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:subject_id])
    @area = @subject.areas.find(params[:id])
    if @area.update(area_params)
      redirect_to subject_area_path(@area.subject, @area), notice: 'Area was successfully updated!'
    else
      render 'edit', notice: 'Oops!'
    end
  end

  def destroy
    @subject = Subject.find(params[:subject_id])
    @area = @subject.areas.find(params[:id])
    @area.destroy
    redirect_to subject_areas_path(@subject)
  end

  private

  def set_area
    @area = Area.find(params[:id])
  end

  def area_params
    params.require(:area).permit(:name, :subject_id)
  end
end
