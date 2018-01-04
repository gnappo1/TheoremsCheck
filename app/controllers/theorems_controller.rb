class TheoremsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_theorem, only: [:show, :edit, :update, :destroy, :save_theorem, :unsave_theorem]
  before_action :set_scientist, only: [:new, :create]
  before_action :check_admin, only: [:edit, :destroy]

  def index
    if params[:search]
      @theorems = Theorem.search(params[:search]).order(name: :desc)
    elsif set_scientist
      @theorems = @scientist.theorems.sort { |a,b| a.name.downcase <=> b.name.downcase }
    else
      @theorems = Theorem.order(name: :desc)
    end
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @post.to_json }
    end
  end

  def new
    if @scientist
      @theorem = @scientist.theorems.build
      @area = @theorem.build_area
    else
      @theorem = Theorem.new
      @area = @theorem.build_area
    end
    render :layout => false
  end

  def create
    if @scientist
      @theorem = @scientist.theorems.build(theorem_params)
    else
      @theorem = Theorem.new(theorem_params)
    end
    if @theorem.save
      respond_to do |format|
        format.js   {render :layout => false, notice: 'Theorem was successfully created.'}
        format.html {redirect_to @theorem, notice: 'Theorem was successfully created.'}
      end
    else
      respond_to do |format|
        format.html { render 'new', notice: @theorem.errors.full_messages.first }
        format.js   { render json: @theorem.errors}
      end
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
    @theorem.corollaries.each{|c| c.destroy}
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
    params.require(:theorem).permit(:name, :statement, :demonstration, :created_by, :scientist_id, :subject_id, :area_id, area_attributes: [:id, :name, :created_by, :subject_id], scientist_attributes: [:id, :full_name, :year_of_birth, :year_of_death, :created_by ])
  end
end
