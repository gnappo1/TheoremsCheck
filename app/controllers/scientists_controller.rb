class ScientistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_scientist, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :destroy]

  def index
    @scientists = Scientist.all
  end

  def show
  end


  def create
    @scientist = Scientist.new(subject_params)
    if @scientist.save
      redirect_to scientist_path, notice: 'Scientist was successfully created.'
    else
      redirect_to scientist_path, notice: "Oops!"
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
    params.require(:scientist).permit(:full_name, :date_of_birth, :date_of_death, :gender)
  end
end
