class QuotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quote, only: [:show, :edit, :update, :destroy, :save_quote, :unsave_quote]
  before_action :set_scientist, only: [:new, :create, :edit, :destroy]
  before_action :check_admin, only: [:edit, :destroy]

  def index
    if set_scientist
      @quotes = @scientist.quotes.order(scientist_id: :desc)
      render :template => "quotes/_quotes_display", layout: false
    else
      @quotes = Quote.all.order(scientist_id: :desc)
    end
  end

  def show
  end

  def new
    @quote = @scientist.quotes.build
    render :layout => false
  end

  def create
    @quote = @scientist.quotes.build(quote_params)
    if @quote.save
      respond_to do |format|
        format.js   {render :layout => false}
        format.html {redirect_to @quote, notice: 'Quote was successfully created.'}
      end
    else
      respond_to do |format|
        format.html { render 'new', notice: @quote.errors.full_messages.first }
        format.js   { render json: @quote.errors}
      end
    end
  end

  def edit
    respond_to do |format|
      format.html { redirect_to edit_quote_path(@quote) }
      format.js   { render :layout => false }
    end
  end

  def update
    if @quote.update(quote_params)
      redirect_to @quote, notice: 'Quote was successfully updated!'
    else
      render 'edit'
    end
  end

  def destroy
    @quote.destroy
    redirect_to @scientist
  end

  def save_quote
    if current_user.add_to_fav(@quote)
      redirect_to @quote, notice: "Quote successfully added to Favorites"
    end
  end

  def unsave_quote
    if current_user.remove_from_fav(@quote)
      redirect_to @quote, notice: "Quote successfully removed from Favorites"
    end
  end

  private

  def set_scientist
    @scientist = Scientist.find_by(id: params[:id]) || @scientist = Scientist.find_by(id: params[:scientist_id])
  end

  def set_quote
    @quote = Quote.find_by(id: params[:id])
  end

  def quote_params
    params.require(:quote).permit(:text, :scientist_id, :created_by)
  end

end
