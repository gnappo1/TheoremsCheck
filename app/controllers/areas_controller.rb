class AreasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subject, only: [:index, :new, :create]
  before_action :set_subject_area, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :destroy]

  def index
    @areas = @subject.areas
    @area = Area.new
    @subject = @area.build_subject
  end

  def show
  end

  def create
    @area = Area.new(area_params)
    if @area.save
      redirect_to subject_area_path(@subject, @area), notice: 'Area was successfully created.'
    else
      redirect_to @subject, notice: @area.errors.full_messages.first
    end
  end

  def edit
  end

  def update
    if @area.update(area_params)
      redirect_to subject_area_path(@area.subject, @area), notice: 'Area was successfully updated!'
    else
      render 'edit', notice: 'Oops!'
    end
  end

  def destroy
    @area.destroy
    redirect_to @subject
  end

  private

  def set_subject
    @subject = Subject.find_by(id: params[:subject_id])
  end

  def set_subject_area
    @subject = Subject.find_by(id: params[:subject_id])
    @area = @subject.areas.find_by(id: params[:id])
  end

  def area_params
    params.require(:area).permit(:name, :subject_id, subject_params: [:id, :name])
  end
end
