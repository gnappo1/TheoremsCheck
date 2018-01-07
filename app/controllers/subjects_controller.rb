class SubjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :destroy]


  def index
    @subjects = Subject.order(name: :asc)
    @subject = Subject.new
  end

  def show
    @area = @subject.areas.build
  end


  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      respond_to do |format|
        format.js {}
      end
    end
  end

  def edit
    respond_to do |format|
      format.html { redirect_to edit_subject_path(@subject) }
      format.js   { render :layout => false }
    end
  end

  def update
    if @subject.update(subject_params)
      redirect_to @subject, notice: 'Subject was successfully updated!'
    else
      render 'edit', notice: 'Oops!'
    end
  end

  def destroy
    @subject.areas.each{|a| a.destroy}
    @subject.theorems.each{|t| t.destroy}
    @subject.corollaries.each{|c| c.destroy}
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_path }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private

  def set_subject
    @subject = Subject.find_by(id: params[:id]) ||   @subject = Subject.find_by(id: params[:subject_id])
  end

  def subject_params
    params.require(:subject).permit(:name, :created_by)
  end
end
