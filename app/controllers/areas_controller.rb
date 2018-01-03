class AreasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subject, only: [:index, :new, :create]
  before_action :set_subject_area, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :destroy]

  def show
    @theorems = @area.theorems
  end

  def create
    @area = @subject.areas.build(area_params)
    @area.created_by = current_user.email
    if @area.save
      respond_to do |format|
        format.js  {}
      end
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
    @area.theorems.each{|t| t.destroy}
    @area.corollaries.each{|c| c.destroy}
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
    params.require(:area).permit(:name, :subject_id, :created_by)
  end
end
