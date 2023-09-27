class QuotesController < ApplicationController
  before_action :set_quotes, only: %i[show edit update destroy]

  def index
    @quotes = Quote.all
  end

  def show; end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      redirect_to quotes_path, notice: "The quote has been created successfully"
    else
      render :new, status: :unprocessable_entity, alert: "An error ocurred, try again"
    end
  end

  def edit; end

  def update
    if @quote.update(quote_params)
      redirect_to quotes_path, notice: "The quote has been updated successfully"
    else
      render :edit, status: :unprocessable_entity, alert: "An error ocurred, try again"
    end
  end

  def destroy
    @quote.destroy
    redirect_to quotes_path, status: :see_other, notice: "The quote was deleted"
  end

  private

  def quote_params
    require.params(:quote).permit(:name)
  end

  def set_quote
    @quote = Quote.find(params[:id])
  end
end
