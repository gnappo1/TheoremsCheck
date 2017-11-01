class ScientistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_scientist, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :destroy]

  def index
    @scientists = Scientist.all
  end

  def show
    @theorem = @scientist.theorems.build
  end

  def new
    @scientist = Scientist.new
    @theorem = @scientist.theorems.build
    @area = @theorem.build_area
    @subject = @theorem.build_subject
  end


  def create
    @scientist = Scientist.new(scientist_params)
    binding.pry
    if @scientist.save
      redirect_to @scientist, notice: 'Scientist was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @scientist.update(scientist_params)
      redirect_to @scientist, notice: 'Scientist was successfully updated!'
    else
      render 'edit', notice: 'Oops!'
    end
  end

  def destroy
    @scientist.theorems.each{ |t| t.destroy }
    @scientist.destroy
    redirect_to scientists_path
  end

  private

  def set_scientist
    @scientist = Scientist.find(params[:id])
  end

  def scientist_params
    params.require(:scientist).permit(:full_name, :year_of_birth, :year_of_death, :created_by, theorems_attributes: [:id, :name, :statement, :demonstration, :scientist_id, :area_id, :subject_id, area_attributes:[:id, :name, :subject_id, subject_attributes: [:id, :name]]])
  end
end
