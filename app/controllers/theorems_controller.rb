class TheoremsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_theorem, only: [:show, :edit, :update, :destroy, :save_theorem, :unsave_theorem]
  before_action :set_scientist, only: [:new, :create]
  before_action :check_admin, only: [:edit, :destroy]

  def index
    if set_scientist
      @theorems = @scientist.theorems.sort { |a,b| a.name.downcase <=> b.name.downcase }
    else
      @theorems = Theorem.order(name: :desc)
    end
  end

  def show
  end

  def new
    @theorem = @scientist.theorems.build
    @area = @theorem.build_area
    @subject = @area.build_subject
  end

  def create
    @theorem = @scientist.theorems.build(theorem_params)
    if @theorem.save
      redirect_to scientist_theorem_path(@scientist, @theorem), notice: 'Theorem was successfully created.'
    else
      redirect_to @scientist, notice: @theorem.errors.full_messages.first
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

  def save_theorem
    if current_user.add_to_fav(@theorem)
      redirect_to @theorem, notice: @theorem.name + " successfully added to Favorites"
    end
  end

  def unsave_theorem
    if current_user.remove_from_fav(@theorem)
      redirect_to @theorem, notice: @theorem.name + " successfully removed from Favorites"
    end
  end

  private

  def set_scientist
    @scientist = Scientist.find_by(id: params[:id]) || @scientist = Scientist.find_by(id: params[:scientist_id])
  end

  def set_theorem
    @theorem = Theorem.find(params[:id])
  end

  def theorem_params
    params.require(:theorem).permit(:name, :statement, :demonstration, :created_by, :scientist_id, :subject_id, :area_id, area_attributes: [:id, :name, :created_by, :subject_id, subject_attributes: [:id, :name, :created_by]])
  end
end
