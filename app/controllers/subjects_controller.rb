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
    binding.pry
    @subject = Subject.new(subject_params)
    if @subject.save
      respond_to do |format|
        format.json {render json: @subject}
        format.html {redirect_to @subject, notice: "Subject was successfully created!"}
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
      respond_to do |format|
        format.html { redirect_to @subject, notice: 'Subject was successfully updated!' }
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
    if @subject.destroy
      @subject.areas.each{|a| a.destroy}
      @subject.theorems.each{|t| t.destroy}
      @subject.corollaries.each{|c| c.destroy}
      respond_to do |format|
        format.html { redirect_to subjects_path, notice: 'Subject was successfully deleted!' }
        format.js   { render :layout => false }
      end
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
