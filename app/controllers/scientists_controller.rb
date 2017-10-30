class ScientistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_scientist, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :destroy]

  def index
    @scientists = Scientist.all
    @scientist = Scientist.new
  end

  def show
  end


  def create
    @scientist = Scientist.new(scientist_params)
    if @scientist.save
      redirect_to @scientist, notice: 'Scientist was successfully created.'
    else
      redirect_to scientists_path, notice: @scientist.errors.full_messages.first
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
    @scientist.destroy
    redirect_to scientists_path
  end

  private

  def set_scientist
    @scientist = Scientist.find(params[:id])
  end

  def scientist_params
    params.require(:scientist).permit(:full_name, :year_of_birth, :year_of_death)
  end
end
