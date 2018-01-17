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
        format.html { redirect_to subject_path(@subject), notice: 'Area was successfully created!' }
        format.js  {}
      end
    end
  end

  def edit
    respond_to do |format|
      format.html { redirect_to edit_subject_area_path(@subject, @area) }
      format.js   { render :layout => false }
    end
  end

  def update
    if @area.update(area_params)
      respond_to do |format|
        format.html { redirect_to subject_area_path(@area.subject, @area), notice: 'Area was successfully updated!'}
        format.js   { render :layout => false }
      end
    else
      respond_to do |format|
        format.html { render 'edit', notice: 'Oops!' }
        format.js   {}
      end
    end
  end

  def destroy
    if @area.destroy
      @area.theorems.each{|t| t.destroy}
      @area.corollaries.each{|c| c.destroy}
      respond_to do |format|
        format.html { redirect_to @subject, notice: 'Area was successfully deleted!' }
        format.js   { render :layout => false }
      end
    end
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
