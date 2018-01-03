class CorollariesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  before_action :set_corollary, only: [:show, :edit, :update, :destroy]
  before_action :set_theorem, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :destroy]

  def index
    @corollaries = @theorem.corollaries
    render :layout => false
  end

  def show
  end

  def new
    @corollary = @theorem.corollaries.build
    render :layout => false
  end

  def create
    @corollary = @theorem.corollaries.build(corollary_params)
    @corollary.area = @theorem.area
    @corollary.subject = @theorem.subject
    @corollary.scientist = @theorem.scientist
    if @corollary.save
      respond_to do |format|
        format.js   {render :layout => false}
        format.html {redirect_to theorem_corollary_path(@corollary.theorem, @corollary), notice: "Corollary successfully created"}
      end
    else
      respond_to do |format|
        format.html { render 'new', notice: @corollary.errors.full_messages.first }
        format.json { render json: @corollary.errors}
        format.js   { render json: @corollary.errors}
      end
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
