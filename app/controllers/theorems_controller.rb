class TheoremsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_theorem, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :destroy]

  def index
    @theorems = Theorem.all
  end

  def show
  end


  def create
    if @scientist
      @theorem = @scientist.theorems.build(theorem_params)
    else
      @theorem = Theorem.new(theorem_params)
    end
    if @theorem.save
      redirect_to @theorem, notice: 'Theorem was successfully created.'
    else
      redirect_to theorems_path, notice: @theorem.errors.full_messages.first
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
    @scientist ? redirect_to @scientist : redirect_to theorems_path
  end

  private

  def set_theorem
    @theorem = Theorem.find(params[:id])
  end

  def theorem_params
    params.require(:theorem).permit(:name, :statement, :demonstration, :scientist_id, :area_id)
  end
end
