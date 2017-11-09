class CorollariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_corollary, only: [:show, :edit, :update, :destroy]
  before_action :set_theorem, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :destroy]

  def index
    @corollaries = @theorem.corollaries
  end

  def show
  end

  def new
    @corollary = @theorem.corollaries.build
  end

  def create
    @corollary = @theorem.corollaries.build(corollary_params)
    @corollary.area = @theorem.area
    @corollary.subject = @theorem.subject
    @corollary.scientist = @theorem.scientist
    if @corollary.save
      redirect_to theorem_corollary_path(@theorem, @corollary), notice: 'Corollary was successfully created.'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @corollary.update(corollary_params)
      redirect_to theorem_corollary_path(@theorem, @corollary), notice: 'Corollary was successfully updated!'
    else
      render 'edit'
    end
  end

  def destroy
    @corollary.destroy
    redirect_to theorem_corollaries_path(@theorem)
  end

  private

  def set_corollary
    @corollary = Corollary.find_by(id: params[:id])
  end

  def set_theorem
    @theorem = Theorem.find_by(id: params[:theorem_id]) || @theorem = Theorem.find_by(id: params[:id])
  end

  def corollary_params
    params.require(:corollary).permit(:name, :statement, :demonstration, :theorem_id, :scientist_id, :area_id, :subject_id, :created_by)
  end
end
