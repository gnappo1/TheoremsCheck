class AreasController < ApplicationController
  before_action :set_area, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :destroy]

  def index
    @areas = Area.all
  end

  def show
  end

  def new
    @area = Area.new
  end

  def create
    @area = Area.new(area_params)
    if @area.save
      redirect_to areas_path, notice: 'Area was successfully created.'
    else
      render 'new', notice: 'Oops!'
    end
  end

  def edit
  end

  def update
    if @area.update(area_params)
      redirect_to @area, notice: 'Area was successfully updated!'
    else
      render 'edit', notice: 'Oops!'
    end
  end

  def destroy
    @area.destroy
  end

  private

  def set_area
    @area = Area.find(params[:id])
  end

  def area_params
    params.require(:area).permit(:name, :subject_id)
  end
end
