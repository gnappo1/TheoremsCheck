class QuotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quote, only: [:show, :edit, :update, :destroy, :save_quote, :unsave_quote]
  before_action :set_scientist, only: [:new, :create]
  before_action :check_admin, only: [:edit, :destroy]

  def index
    if set_scientist
      @quotes = @scientist.quotes
    else
      @quotes = Quote.all
    end
  end

  def show
  end

  def new
    @quote = @scientist.quotes.build
  end

  def create
    @quote = @scientist.quotes.build(quote_params)
    if @quote.save
      redirect_to @quote, notice: 'Quote was successfully created.'
    else
      render 'new'
    end
  end

  def edit
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
    redirect_to quotes_path
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
    @quote = Quote.find(params[:id])
  end

  def theorem_params
    params.require(:quote).permit(:text, :scientist_id, :created_by)
  end

end
