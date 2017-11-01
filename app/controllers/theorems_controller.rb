class TheoremsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_theorem, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :destroy]

  def index
    @theorems = Theorem.all
  end

  def show
  end

  def new
    @scientist = Scientist.find_by(id: params[:scientist_id])
    @theorem = Theorem.new
    @theorem.build_area
    @theorem.build_subject
  end

  def create
    @scientist = Scientist.find_by(id: params[:scientist_id])
    @theorem = Theorem.new(theorem_params)
    if @theorem.save
      redirect_to scientist_theorem_path(@scientist, @theorem), notice: 'Theorem was successfully created.'
    else
      redirect_to theorems_path, notice: 'Oops'
    end
  end

  def edit
  end

  def update
    if @theorem.update(theorem_params)
      redirect_to @theorem, notice: 'Theorem was successfully updated!'
    else
      render 'edit', notice: 'Oops!'
    end
  end

  def destroy
    @theorem.destroy
    redirect_to theorems_path
  end

  private

  def set_theorem
    @theorem = Theorem.find(params[:id])
  end

  def theorem_params
    params.require(:theorem).permit(:name, :statement, :demonstration, :scientist_id, :area_id, area_attributes: [:id, :name, :subject_id, subject_attributes: [:id, :name]])
  end
end
