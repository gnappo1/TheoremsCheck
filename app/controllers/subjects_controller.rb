class SubjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :destroy]

  def index
    @subjects = Subject.all
    @subject = Subject.new
  end

  def show
    @area = @subject.areas.build
  end


  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to subjects_path, notice: 'Subject was successfully created.'
    else
      redirect_to subjects_path, notice: @subject.errors.full_messages.first
    end
  end

  def edit
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
    @subject.destroy
    redirect_to subjects_path
  end

  private

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name, :created_by)
  end
end
