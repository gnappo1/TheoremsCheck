class AreasController < ApplicationController
  before_action :set_area, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :destroy]

  def index
    @areas = Area.all
  end

  def show
  end

  private

  def set_area
    @area = Area.find(params[:id])
  end

  def area_params
    params.require(:area).permit(:name, :subject_id)
  end
end
