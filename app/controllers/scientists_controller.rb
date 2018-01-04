class ScientistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_scientist, only: [:show, :edit, :update, :destroy, :save_scientist, :unsave_scientist]
  before_action :check_admin, only: [:edit, :destroy]

  def index
    if params[:search]
      @scientists = Scientist.search(params[:search]).order(full_name: :desc)
    else
      @scientists = Scientist.order(full_name: :desc)
    end
  end

  def show
    @theorem = @scientist.theorems.build
  end

  def new
    @scientist = Scientist.new
    @theorem = @scientist.theorems.build
    @area = @theorem.build_area
    render :layout => false
  end


  def create
    @scientist = Scientist.new(scientist_params)
    if @scientist.save
      respond_to do |format|
        format.js   {render :layout => false}
        format.html {redirect_to @scientist, notice: 'Scientist, Theorem and area were successfully created.'}
      end
    else
      respond_to do |format|
        format.html { render 'new', notice: @scientist.errors.full_messages.first }
        format.js   { render json: @scientist.errors}
      end
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
    @scientist.corollaries.each{|c| c.destroy}
    @scientist.quotes.each{ |q| q.destroy }
    @scientist.destroy
    redirect_to scientists_path
  end

  def save_scientist
    if current_user.add_to_fav(@scientist)
      redirect_to @scientist, notice: @scientist.full_name + " successfully added to Favorites"
    end
  end

  def unsave_scientist
    if current_user.remove_from_fav(@scientist)
      redirect_to @scientist, notice: @scientist.full_name + " successfully removed from Favorites"
    end
  end

  private

  def set_scientist
    @scientist = Scientist.find(params[:id]) || @scientist = Scientist.find(params[:scientist_id])
  end

  def scientist_params
    params.require(:scientist).permit(:full_name, :year_of_birth, :year_of_death, :created_by, theorems_attributes: [:id, :name, :statement, :demonstration, :created_by, :scientist_id, :subject_id, :area_id, area_attributes:[:id, :name, :created_by, :subject_id]])
  end
end
